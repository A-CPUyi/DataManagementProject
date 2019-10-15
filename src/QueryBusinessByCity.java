import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * QueryBusinessByCity
 */
public class QueryBusinessByCity extends Query {

    // java dose not support multi-line string?
    String queryStmt = "SELECT business_name, City"
            + " from project1_main.business"
            + " where business.City = ? group by business.business_name;";

    String resultColumnNames[] = {"business_name", "rating"};

    /**
     * !!!important: init the query statement with a prepareStatement class to prevent injection attack
     */
    public QueryBusinessByCity() {
        String options[] = { "查询类别-business", "查询分类-city" };
        this.options = options;
        String inputTiles[] = { "城市 = " };
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