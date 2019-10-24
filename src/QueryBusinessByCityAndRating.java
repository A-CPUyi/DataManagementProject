import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * QueryBusinessByCityAndRating
 */
public class QueryBusinessByCityAndRating extends Query {

    // java dose not support multi-line string?
    String queryStmt = "select businessView.name, rating from (" + " SELECT businessView.name, AVG(review.stars) as rating"
            + " FROM project1_main.review, project1_main.business" + " where businessView.id = review.business_id and"
            + " business_location.City = ? group by businessView.name) as temp" + " where rating > ? ;";

    String resultColumnNames[] = {"business_name", "rating"};

    /**
     * !!!important: init the query statement with a prepareStatement class to prevent injection attack
     */
    public QueryBusinessByCityAndRating() {
        String options[] = { "SearchCategory-business", "查询分类-city", "optionLevel2-rating > " };
        this.options = options;
        String inputTiles[] = { "City = ", "Rating > " };
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
            tempRow[0] = rawResults.getString(1);
            tempRow[1] = "" + rawResults.getFloat(resultColumnNames[1]);//float to string
            rows.add(tempRow);
        }
        return rows;
    }
}