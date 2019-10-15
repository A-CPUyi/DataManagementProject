import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * QueryBusinessByCityAndRating
 */
public class QueryBusinessByCityAndRating extends Query {

    // java dose not support multi-line string?
    String queryStmt = "select business_name, rating from (" + " SELECT business_name, AVG(review.stars) as rating"
            + " FROM project1_main.review, project1_main.business" + " where business.id = review.business_id and"
            + " business.City = ?) as temp" + " where rating > ?;";

    String resultColumnNames[] = {"business_name", "rating"};

    public QueryBusinessByCityAndRating() {
        String options[] = { "查询类别-business", "查询分类-city", "optionLevel2-rating > " };
        this.options = options;
        String inputTiles[] = { "城市 = ", "评分 > " };
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