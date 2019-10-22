import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * QueryCompareFoodChainedRatingInCity
 */
public class QueryCompareFoodChainedRatingInCity extends Query {

    // java dose not support multi-line string?
    String queryStmt = "select business_chain.is_chain, avg(review.stars)" +
    " from business_location, food, business, business_chain, review" +
    " where business_location.city = ? " +
    " and food.id = business_location.id" +
    " and food.id = business.id" +
    " and business.business_name = business_chain.business_name" +
    " and business_location.id = review.business_id" +
    " group by business_chain.is_chain";

    String resultColumnNames[] = {"is_chained", "avg_rating"};

    /**
     * !!!important: init the query statement with a prepareStatement class to prevent injection attack
     */
    public QueryCompareFoodChainedRatingInCity() {
        String options[] = { "查询类别-Compare Review", "比较类别-Chained", "经营类别-Food", "比较区域-城市" };
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