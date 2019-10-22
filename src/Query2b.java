import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * QueryBusinessByCityAndRating
 */
public class Query2b extends Query {

    // java dose not support multi-line string?
    String queryStmt = "SELECT S.business_name FROM" 
    		+ " project1_main.business S, project1_main.shopping G, project1_main.business_location L,"
            + " (select R1.business_id,COUNT(*) AS reviewNo from project1_main.review R1 group by R1.business_id) AS A, "
            + " (select R2.business_id,COUNT(*) AS reviewNo2 from project1_main.review R2 WHERE R2.stars > 3 group by R2.business_id) AS B"
            + " where S.id = G.id"
            + " and L.postal_code = ?"
            + " and S.id = L.id"
            + " and A.business_id = S.id"
            + " and A.business_id = B.business_id"
            + " AND B.reviewNo2/A.reviewNo > 0.5;";

    String resultColumnNames[] = {"business_name"};

    /**
     * !!!important: init the query statement with a prepareStatement class to prevent injection attack
     */
    public Query2b() {
        String options[] = { "SearchCategory-business", "BusinessType-TypeShopping", "Specific - have more than half receieved ratings hihger than 3 " };
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