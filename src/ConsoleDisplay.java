import java.util.List;
import java.util.Scanner;

/**
 * ConsoleDisplay
 */
public class ConsoleDisplay extends Display {
    ConsoleDisplay() {
    }

    @Override
    public void init() {
        Display.display = this;
    }

    @Override
    public void displayInterface() {
        System.out.println("yeah I'm trying to show something");
        System.out.println("use command 0 to try execute current query");
        Scanner input = new Scanner(System.in);
        OptionTree tree = OptionTree.getOptionTree();
        tree.restart();
        boolean excuteFlag = false;
        while (!excuteFlag) {
            System.out.print(tree.getCurrent().optionTitle + ": ");
            String options[] = new String[tree.getCurrent().child.keySet().size()];
            options = tree.getCurrent().child.keySet().toArray(options);
            for (int i = 1; i <= options.length; i++) {
                System.out.print("" + i + '.' + options[i - 1]);
            }
            System.out.println();

            // if it dose not have next line it waits
            if(input.hasNext()){
                int index = Integer.parseInt(input.nextLine());
                if(index == 0){
                    //TODO start new search
                    excuteFlag = runQuery(input, tree);
                }
                else{
                    try {
                        tree.getCurrent().moveToNext(options[index - 1]);
                        //the leaf node has only query but nothing else
                        if(tree.getCurrent().optionTitle == null){
                            runQuery(input, tree);
                        }
                    } catch (Exception e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }
                }
            }

        }
        input.close();
    }

    private boolean runQuery(Scanner input, OptionTree tree){
        String inputArgs[] = new String[tree.getCurrent()
            .query.get().userInputTitles.length];
        for(int i=0;i<inputArgs.length;i++){
            System.out.print(tree.getCurrent().query.get().userInputTitles[i]);
            inputArgs[i] = input.nextLine();
        }
        tree.getCurrent().executeUserInput(inputArgs);
        return true;
    }

    @Override
    public void displayResuls(String[] columnNames, List<String[]> contents) {
        for(String s : columnNames){
            System.out.print(s + "  ");
        }
        System.out.println();

        //换行开始输出内容
        contents.forEach( (row) -> {
            String tempLine = "";
            for(String s : row)
                tempLine += s + " | ";
            System.out.println(tempLine);
        });
    }
}