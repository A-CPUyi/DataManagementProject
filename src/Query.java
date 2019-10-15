import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.function.Function;

/**
 * Query
 */
public abstract class Query {
    //option name and the option_str are divided by '-''
    String options[];
    String userInputTitles[];
    PreparedStatement stmt;

    public Query(){
        dB_connection = Utility.getConnection();
        dB_connection.prepareStatement("");
    }

    //take whatever input in string and parse them in this object
    public abstract void acceptUserInput(String inputs[]);
}