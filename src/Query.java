import java.sql.PreparedStatement;

/**
 * Query
 */
public abstract class Query {
    /**
     * Here I use public because I'll have to present it to the option tree and since
     * there is no such thing as immutability or c++ const equivalent in Java, I decide 
     * not to bother myself with writing getter methods and just make them public, because 
     * they won't be safe anyway.
     * 
     * FUCK JAVA
     * Yi Lan
     */
    //option name and the option_str are divided by '-''
    public String options[];
    public String userInputTitles[];
    public PreparedStatement stmt;

    //take whatever input in string and parse them in this object
    public abstract void acceptUserInput(String inputs[]);
}