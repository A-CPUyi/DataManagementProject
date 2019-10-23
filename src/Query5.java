import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * QueryBusinessByCityAndRating
 */
public class Query5 extends Query {

    // java dose not support multi-line string?
    String queryStmt = "select A.u_name as User1, B.u_name as User2 from" 
    		+ " (select review.business_id b_id, review.user_id u_id, review.stars stars, user.user_name u_name"
            + " from review, food, user"
            + " where review.business_id = food.id"
            + " and user.user_id = review.user_id limit 10000) as A,"
            + " (select review.business_id b_id, review.user_id u_id, review.stars stars, user.user_name u_name"
            + " from review, food, user"
            + " where review.business_id = food.id"
            + " and user.user_id = review.user_id limit 10000) as B"
            + " where A.b_id = B.b_id"
            + " and A.stars = B.stars"
            + " and A.u_id < B.u_id"
            + " group by A.u_id, B.u_id"
            + " having count(*) > 3;";

    String resultColumnNames[] = {"User1", "User2"};

    /**
     * !!!important: init the query statement with a prepareStatement class to prevent injection attack
     */
    public Query5() {
        String options[] = { "SearchCategory-User", "Category-Review", "BusinessType-TypeRestaurant", "Specific - user pairs that had rated the same to a restaurant more than three times" };
        this.options = options;
        String inputTiles[] = {};
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
            tempRow[1] = rawResults.getString(resultColumnNames[1]);
            rows.add(tempRow);
        }
        return rows;
    }
}