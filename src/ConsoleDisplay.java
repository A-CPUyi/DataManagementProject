/**
 * ConsoleDisplay
 */
public class ConsoleDisplay extends Display{
    ConsoleDisplay(){}

    @Override
    public void init() {
        this.display = this;
    }

    @Override
    public void displayInterface() {
        // TODO Auto-generated method stub
        System.out.println("yeah I'm trying to show something");

    }

    @Override
    public void displayResuls(String[] columnNames, String[][] contents) {
        for(String s : columnNames){
            System.out.print(s + "  ");
        }
        System.out.println();

        //换行开始输出内容
        for(int i=0;i<contents.length;i++){
            for(String s : contents[i])
                System.out.print(s + " ");
        }
    }
}