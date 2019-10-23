import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * QueryUserNameReviewedFoodInAirport
 */
public class QueryUserNameReviewedFoodInAirport extends Query {

    //review date input format year-month-day
    String queryStmt = "select user_name from located_in, food, review, user" + 
        " where located_in.location_type = \"airport\" " +
        " and located_in.business_id = food.id" +
        " and review.business_id = located_in.business_id" +
        " and review.review_date between ? and ?" +
        " and user.user_id = review.user_id" +
        " group by user.user_id";

    String resultColumnNames[] = {"user_name"};

    /**
     * !!!important: init the query statement with a prepareStatement class to prevent injection attack
     */
    public QueryUserNameReviewedFoodInAirport() {
        String options[] = { "SearchCategory-User", "查询分类-Review", "Range-Date"
        , "BusinessType-Food", "LocationType-Airport" };
        this.options = options;
        String inputTiles[] = { "Starting Date = ", "EndDate = "};
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