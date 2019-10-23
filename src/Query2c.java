import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * QueryBusinessByCityAndRating
 */
public class Query2c extends Query {

    // java dose not support multi-line string?
    String queryStmt =  "select business.business_name, goodReview.count, badReview.count from business," 
    		+ " (select review.business_id b_id, count(review.business_id) count from review,"
            + "  (select business_location.id as b_id"
            + " from business_location, beauty"
            + " where business_location.postal_code = ?"
            + " and business_location.id = beauty.id) as temp1"
            + " where review.business_id = temp1.b_id"
            + " and review.stars > 3.0"
            + " group by review.business_id) as goodReview,"
            + " (select review.business_id b_id, count(review.business_id) count from review, "
            + " (select business_location.id as b_id"
            + " from business_location, beauty"
            + " where business_location.postal_code = ?"
            + " and business_location.id = beauty.id) as temp1"
            + " where review.business_id = temp1.b_id"
            + " and review.stars <= 3.0"
            + " group by review.business_id) as badReview"
            + " where goodReview.b_id = badReview.b_id"
            + " and (goodReview.count - badReview.count) > 0"
            + " and business.id = goodReview.b_id;";

    String resultColumnNames[] = {"business_name"};

    /**
     * !!!important: init the query statement with a prepareStatement class to prevent injection attack
     */
    public Query2c() {
        String options[] = { "SearchCategory-business", "QueryType-BusinessType", "BusinessType-TypeBeauty", "Specific - have more than half receieved ratings hihger than 3 " };
        this.options = options;
        String inputTiles[] = { "ZipCode = "};
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
            stmt.setString(2,  inputs[0]);
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
            rows.add(tempRow);
        }
        return rows;
    }
}