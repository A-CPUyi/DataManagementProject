import java.util.List;

/**
 * ConsoleDisplay
 */
public class ConsoleDisplay extends Display{
    ConsoleDisplay(){}

    @Override
    public void init() {
        Display.display = this;
    }

    @Override
    public void displayInterface() {
        // TODO Auto-generated method stub
        System.out.println("yeah I'm trying to show something");

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
                tempLine += s + " ";
            System.out.println(tempLine);
        });
    }
}