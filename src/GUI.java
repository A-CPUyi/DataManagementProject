import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Vector;
import java.util.List;


public class GUI {
    private JButton queryBtn = new JButton("查询");
    private JButton refreshBtn = new JButton("重置");
    private JButton outputBtn = new JButton("导出");
    private List<QueryPanel> queryPanelList;
    private boolean canQuery = false;
    List<TextPanel> list;
    JPanel tablePanel;
    JScrollPane jScrollPane;
    String[][] data;
    String[] columnName;


    private JTextArea textarea = new JTextArea(5, 5);
    private JTable table;
    private Vector<Vector<String>> dataModel = new Vector<Vector<String>>();
    JPanel controlPanel = new JPanel();
    private GuiDisplay guiDisplay;

    public GUI(String optionTitle, String[] options, GuiDisplay guiDisplay) {
        JFrame frame = new JFrame("Query");
        Vector<String> titles = new Vector<String>();
        table = new JTable(dataModel, titles);
        this.guiDisplay = guiDisplay;



        controlPanel.setLayout(new FlowLayout());
        controlPanel.add(queryBtn);
        controlPanel.add(refreshBtn);
        controlPanel.add(outputBtn);
        queryPanelList = new ArrayList<>();

        String[] newOptions = new String[options.length+1];
        newOptions[0] = "";
        int i = 1;
        for(String option : options){
            newOptions[i] = option;
        }
        QueryPanel first = new QueryPanel(optionTitle, newOptions, 0);
        queryPanelList.add(first);
        controlPanel.add(first);
        controlPanel.setPreferredSize(new Dimension(0, 130));

        tablePanel = new JPanel();
        tablePanel.setLayout(new BoxLayout(tablePanel, BoxLayout.Y_AXIS));
        tablePanel.add(Box.createRigidArea(new Dimension(0, 20)));
        tablePanel.add(table.getTableHeader());
        jScrollPane = new JScrollPane(table);
        tablePanel.add(jScrollPane);

        JPanel container = new JPanel();
        container.setLayout(new BorderLayout());
        container.add(textarea, BorderLayout.NORTH);
        container.add(tablePanel, BorderLayout.CENTER);

        frame.add(controlPanel, BorderLayout.NORTH);
        frame.add(container, BorderLayout.CENTER);
        frame.add(Box.createRigidArea(new Dimension(20, 0)), BorderLayout.WEST);
        frame.add(Box.createRigidArea(new Dimension(20, 0)), BorderLayout.EAST);
        frame.add(Box.createRigidArea(new Dimension(0, 20)), BorderLayout.SOUTH);

        setActionListener(first);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setMinimumSize(new Dimension(750, 500));
        frame.setVisible(true);
        frame.setResizable(false);
    }

    private void setActionListener(QueryPanel first) {
        first.addItemListener(new ItemListenerImpl(first));
        queryBtn.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                if(canQuery){
                    String[] inputArgs = new String[list.size()];
                    for(int i = 0; i < list.size(); i++ ){
                        TextPanel textPanel = list.get(i);
                        inputArgs[i] = textPanel.getText();
                    }
                    guiDisplay.runQuery(inputArgs);
                }
            }
        });

        refreshBtn.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                for(QueryPanel queryPanel: queryPanelList){
                    controlPanel.remove(queryPanel);
                }
                queryPanelList.clear();
                if(list != null){
                    for(TextPanel textPanel: list){
                        controlPanel.remove(textPanel);
                    }
                    list.clear();
                }

                QueryPanel newQueryPanel = guiDisplay.restart();
                controlPanel.add(newQueryPanel);
                queryPanelList.add(newQueryPanel);
                newQueryPanel.addItemListener(new ItemListenerImpl(newQueryPanel));

                controlPanel.validate();
                controlPanel.updateUI();

            }
        });

        outputBtn.addActionListener(new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent e) {
                JFileChooser chooser = new JFileChooser();
                if (chooser.showSaveDialog(outputBtn)==JFileChooser.APPROVE_OPTION) {
                    File file = chooser.getSelectedFile();
                    writeFile(file.getPath());
                }
            }
        });
    }

    public void writeFile(String savepath){//写文件
        FileOutputStream fos= null;
        try {
            fos=new FileOutputStream(savepath);
            StringBuilder sb = new StringBuilder();
            for(String name : columnName){
                sb.append(name);
                sb.append("\t");
            }
            sb.append("\n");
            for(String[] dataRow : data){
                for(String dataItem : dataRow){
                    sb.append(dataItem);
                    sb.append("\t");
                }
                sb.append("\n");
            }
            fos.write(sb.toString().getBytes());

            fos.close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public void displayResults(String[] columnNames, List<String[]> contents) {
        data = new String[contents.size()][columnNames.length];
        int i = 0;
        for(String[] content : contents){
            data[i] = content;
            i++;
        }
        this.columnName = columnNames;
        tablePanel.remove(jScrollPane);
        table = new JTable(data, columnNames);
        jScrollPane =  new JScrollPane(table);
        tablePanel.add(jScrollPane);
        tablePanel.validate();
        tablePanel.updateUI();

    }

    class ItemListenerImpl implements ItemListener{
        private QueryPanel queryPanel;
        public ItemListenerImpl(QueryPanel queryPanel) {
            this.queryPanel = queryPanel;
        }

        @Override
        public void itemStateChanged(ItemEvent e) {
            if(e.getStateChange() == ItemEvent.SELECTED){
                String option = queryPanel.getOptions();
                int level = queryPanel.getLevel();
                QueryPanel newQuery = guiDisplay.getNewOptions(level, option);
                for(QueryPanel queryPanel : queryPanelList){
                    queryPanel.setEnabled (false);
                }
                if(newQuery == null){
                    canQuery = true;
                    list = guiDisplay.getUserInput();
                    for(TextPanel textPanel : list){
                        controlPanel.add(textPanel);
                    }
                }else{
                    for(int i = level + 1; i < queryPanelList.size(); i++){
                        QueryPanel queryPanel = queryPanelList.get(i);
                        controlPanel.remove(queryPanel);
                    }
                    newQuery.addItemListener(new ItemListenerImpl(newQuery));
                    queryPanelList.add(newQuery);
                    controlPanel.add(newQuery);
                }
                controlPanel.revalidate();
            }
        }
    }

}

class QueryPanel extends JPanel {
    private JLabel label;
    private JComboBox<String> jComboBox;
    private int level;

    public QueryPanel(String labelText, String[] options, int level) {
        label = new JLabel(labelText);
        jComboBox = new JComboBox<>(options);
        this.level = level;
        this.add(label);
        this.add(jComboBox);
    }


    public String getOptions() {

        return (String) jComboBox.getSelectedItem();
    }
    public int getOptionIndex(){
        return jComboBox.getSelectedIndex();
    }

    public void addItemListener(ItemListener aListener){
      jComboBox.addItemListener(aListener);
    }

    public int getLevel() {
        return level;
    }

    public void setEnabled (boolean flag){
        jComboBox.setEnabled(flag);
    }
}

class TextPanel extends JPanel {
    private JLabel label;
    private JTextField text;

    public TextPanel(String labelStr) {
        label = new JLabel(labelStr);
        text = new JTextField(20);
        this.add(label);
        this.add(text);
    }


    public String getText() {
        return text.getText();
    }
}
