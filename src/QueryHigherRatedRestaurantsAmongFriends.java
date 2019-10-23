import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * QueryHigherRatedRestaurantsAmongFriends
 */
public class QueryHigherRatedRestaurantsAmongFriends extends Query{
    String queryStmt =
        "select business.business_name,highRating.num, lowRating.num from business," +
            " (select basic.b_id b_id, count(basic.stars) num from" +
                " (select reviewed.b_id b_id, reviewed.stars stars from" +
                    " (select friends_with.user_id2 u_id from friends_with where friends_with.user_id1 = ?) as friend,"+
                    " (select review.user_id u_id, review.business_id b_id, review.stars stars " +
                        " from review, food " +
                        " where review.business_id = food.id" +
                        " ) as reviewed" +
                    " where friend.u_id = reviewed.u_id) as basic" +
                " where basic.stars >= 4.0" +
                " group by basic.b_id) as highRating," +
            " (select basic.b_id b_id, count(basic.stars) num from" +
                " (select reviewed.b_id b_id, reviewed.stars stars from" +
                    " (select friends_with.user_id2 u_id from friends_with where friends_with.user_id1 = ?) as friend," +
                    " (select review.user_id u_id, review.business_id b_id, review.stars stars "+
                        " from review, food " +
                        " where review.business_id = food.id" +
                        " ) as reviewed" +
                    " where friend.u_id = reviewed.u_id) as basic" +
                " where basic.stars < 4.0" +
                " group by basic.b_id) as lowRating" +
        " where highRating.b_id = lowRating.b_id" +
        " and highRating.num > lowRating.num" +
        " and business.id = highRating.b_id";

    String resultColumnNames[] = {"business_name"};

    /**
     * !!!important: init the query statement with a prepareStatement class to prevent injection attack
     */
    public QueryHigherRatedRestaurantsAmongFriends() {
        String options[] = { "SearchCategory-business", "查询分类-Well Rated Among Frineds" };
        this.options = options;
        String inputTiles[] = { "UserId = " };
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