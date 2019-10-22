import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * QueryBusinessByCityAndRating
 */
public class Query1 extends Query {

    // java dose not support multi-line string?
    String queryStmt = "select user_name from (" + " project1_main.user U, project1_main.review V"
            + " where user_name like ?" + "and U.user_id = V.user_id"
            + " group by V.user_id having count(V.review_text) > ?;";

    String resultColumnNames[] = {"user_name"};

    /**
     * !!!important: init the query statement with a prepareStatement class to prevent injection attack
     */
    public Query1() {
        String options[] = { "SearchCategory-User", "NameStartWith-Word", "level3-temp > " };
        this.options = options;
        String inputTiles[] = { "nameStartWith = ", "number of reviews > " };
        this.userInputTitles = inputTiles;
        try {
            this.stmt = Utility.getConnection().prepareStatement(queryStmt);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    @Override
    public void acceptUserInput(String[] inputs) {
        try {
            stmt.setString(1,  inputs[0]);
            stmt.setFloat(2, Float.parseFloat(inputs[1]));
            List<String[]>result = processResultSet(stmt.executeQuery());
            Display.getDisplay().displayResuls(resultColumnNames, result);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    private List<String[]> processResultSet(ResultSet rawResults) throws SQLException { 
        List<String[]> rows = new ArrayList<String[]>();
        while(rawResults.next()){
            String tempRow[] = new String[resultColumnNames.length];
            tempRow[0] = rawResults.getString(resultColumnNames[0]);
            tempRow[1] = "" + rawResults.getFloat(resultColumnNames[1]);//float to string
            rows.add(tempRow);
        }
        return rows;
    }
}