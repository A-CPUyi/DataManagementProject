import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * QueryUserPreferFoodOverShopping
 */
public class QueryUserPreferFoodOverShopping extends Query {

    // java dose not support multi-line string?
    String queryStmt = 
        "select foodRate.u_id from" +
        " (select review.user_id u_id, avg(review.stars) foodAvg from food, review, business_location" +
            " where food.id = review.business_id" +
            " and business_location.postal_code = ?" +
            " and business_location.id = food.id" +
            " group by review.user_id) as foodRate," +
        " (select review.user_id u_id, avg(review.stars) shopAvg from shopping, review, business_location" +
            " where shopping.id = review.business_id" +
            " and business_location.postal_code = ?" +
            " and business_location.id = shopping.id" +
            " group by review.user_id) as shoppingRate" +
        " where foodRate.foodAvg > shoppingRate.shopAvg" +
        " and foodRate.u_id = shoppingRate.u_id";

    String resultColumnNames[] = {"user_id"};

    /**
     * !!!important: init the query statement with a prepareStatement class to prevent injection attack
     */
    public QueryUserPreferFoodOverShopping() {
        String options[] = { "SearchCategory-User", "SearchType-Preference", "Prefer-Food", "Over-Shopping" };
        this.options = options;
        String inputTiles[] = { "In Area = " };
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
            tempRow[0] = rawResults.getString(1);
            rows.add(tempRow);
        }
        return rows;
    }
}