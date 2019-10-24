import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * QueryBusinessByCityAndRating
 */
public class Query3a extends Query {

    // java dose not support multi-line string?
    String queryStmt = "select business_name from businessView, business_location, business_checkin, food" 
    		+ " where businessView.id = food.id"
            + " and businessView.id = business_location.id"
            + " and businessView.id = business_checkin.id"
            + " and business_location.postal_code = ?"
            + " and business_checkin.date between ? and ?"
            + " group by business_checkin.id"
            + " order by count(*) desc;";

    String resultColumnNames[] = {"business_name"};

    /**
     * !!!important: init the query statement with a prepareStatement class to prevent injection attack
     */
    public Query3a() {
        String options[] = { "SearchCategory-business", "QueryType-BusinessType", "BusinessType-TypeRestaurant", "Specific - order by popularity during given time period" };
        this.options = options;
        String inputTiles[] = { "ZipCode = ", "TimeStartWith = ", "TimeEndWith = "};
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
            stmt.setString(2,  inputs[1]);
            stmt.setString(3,  inputs[2]);
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
            tempRow[0] = rawResults.getString(1);
            rows.add(tempRow);
        }
        return rows;
    }
}