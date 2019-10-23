import java.util.List;

abstract class Display {
    static Display display;

    public abstract void init();
    public abstract void displayInterface();
    /**
     * 
     * @param columnNames
     * @param contents row major table
     */
    public abstract void displayResuls(String columnNames[], List<String[]> contents);

    /**
     * if the display object has not being initialized, throw null pointer Exception
     * @return
     */
    public static Display getDisplay() throws NullPointerException{
        if(display == null)
            throw new NullPointerException();
        return display;
    }
}