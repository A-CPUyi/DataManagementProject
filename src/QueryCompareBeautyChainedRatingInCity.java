import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * QueryCompareBeautyChainedRatingInCity
 */
public class QueryCompareBeautyChainedRatingInCity extends Query {

    // java dose not support multi-line string?
    String queryStmt = "select business_chain.is_chain, avg(review.stars)" +
    " from business_location, beauty, businessView, business_chain, review" +
    " where business_location.city = ? " +
    " and beauty.id = business_location.id" +
    " and beauty.id = businessView.id" +
    " and businessView.name = business_chain.business_name" +
    " and business_location.id = review.business_id" +
    " group by business_chain.is_chain";

    String resultColumnNames[] = {"is_chained", "avg_rating"};

    /**
     * !!!important: init the query statement with a prepareStatement class to prevent injection attack
     */
    public QueryCompareBeautyChainedRatingInCity() {
        String options[] = { "SearchCategory-Compare Review", "CompareType-Chained", "BusinessCategory-Beauty", "CompareArea-City" };
        this.options = options;
        String inputTiles[] = { "City = " };
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
            tempRow[0] = "" + rawResults.getBoolean(1);
            tempRow[1] = "" + rawResults.getFloat(2);//float to string
            rows.add(tempRow);
        }
        return rows;
    }
}