import java.sql.SQLException;

/**
 * QueryBusinessByCityAndRating
 */
public class QueryBusinessByCityAndRating extends Query {

    // java dose not support multi-line string?
    String queryStmt = "select business_name, rating from (" + "SELECT business_name, AVG(review.stars) as rating "
            + "FROM project1_main.review, project1_main.business" + "where business.id = review.business_id and "
            + "business.City = ?) temp" + "where rating > ?";

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
            stmt.setString(1, "\"" + inputs[0] + "\"");
            stmt.setFloat(2, Float.parseFloat(inputs[1]));
            stmt.executeQuery();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}