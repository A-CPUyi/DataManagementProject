import java.util.ArrayList;
import java.util.List;

public class GuiDisplay extends Display {
    GUI gui;
    @Override
    public void init() {
        Display.display = this;
    }

    @Override
    public void displayInterface() {
        OptionTree tree = OptionTree.getOptionTree();
        tree.restart();
        String options[] = new String[tree.getCurrent().child.keySet().size()];
        options = tree.getCurrent().child.keySet().toArray(options);

        gui = new GUI(tree.getCurrent().optionTitle, options, this);

    }



    @Override
    public void displayResuls(String[] columnNames, List<String[]> contents) {
        gui.displayResults(columnNames, contents);
    }

    public QueryPanel getNewOptions(int level, String option) {
        OptionTree tree = OptionTree.getOptionTree();

        try {
            tree.getCurrent().moveToNext(option);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(tree.getCurrent().optionTitle == null){
            return null;
        }
        String optionTitle = tree.getCurrent().optionTitle;
        String options[] = new String[tree.getCurrent().child.keySet().size()];
        options = tree.getCurrent().child.keySet().toArray(options);

        String[] newOptions = new String[options.length+1];
        newOptions[0] = "";
        int i = 1;
        for(String str : options){
            //bug 2
            newOptions[i++] = str;
        }
        return new QueryPanel(optionTitle, newOptions, level + 1);
    }

    public List<TextPanel> getUserInput() {
        OptionTree tree = OptionTree.getOptionTree();
        String inputArgs[] = tree.getCurrent().query.get().userInputTitles;
        List<TextPanel> textPanels = new ArrayList<>();
        for(String input: inputArgs){
            textPanels.add(new TextPanel(input));
        }
        return textPanels;
    }

    public void runQuery(String[] inputArgs) {
        OptionTree tree = OptionTree.getOptionTree();
        tree.getCurrent().executeUserInput(inputArgs);
    }

    public QueryPanel restart() {
        OptionTree tree = OptionTree.getOptionTree();
        tree.restart();
        String optionTitle = tree.getCurrent().optionTitle;
        String options[] = new String[tree.getCurrent().child.keySet().size()];
        options = tree.getCurrent().child.keySet().toArray(options);

        String[] newOptions = new String[options.length+1];
        newOptions[0] = "";
        int i = 1;
        for(String str : options){
            //bug 3
            newOptions[i++] = str;
        }
        return new QueryPanel(optionTitle, newOptions, 0);
    }
}
