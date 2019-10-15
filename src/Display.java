abstract class Display {
    Display display;

    public abstract void init();
    public abstract void displayInterface();
    /**
     * 
     * @param columnNames
     * @param contents row major table
     */
    public abstract void displayResuls(String columnNames[], String contents[][]);

    /**
     * if the display object has not being initialized, throw null pointer Exception
     * @return
     */
    public Display getDisplay() throws NullPointerException{
        if(display == null)
            throw new NullPointerException();
        return display;
    }
}