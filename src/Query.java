import java.sql.PreparedStatement;

/**
 * Query
 */
public abstract class Query {
    //option name and the option_str are divided by '-''
    String options[];
    String userInputTitles[];
    PreparedStatement stmt;

    //take whatever input in string and parse them in this object
    public abstract void acceptUserInput(String inputs[]);
}