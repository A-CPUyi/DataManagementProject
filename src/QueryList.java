/**
 * QueryList
 */
public class QueryList {
    public static final Query[] queryList = {
        /**Shuo Yao */
        new Query1(),
        new Query2a(),
        new Query2b(),
        new Query2c(),

        //4
        new QueryHigherRatedRestaurantsAmongFriends(),
        
        /**don't change it automatically generated code */
        //7
        new QueryUserNameReviewedFoodInAirport(),
        new QueryUserNameReviewedFoodInTrainStation(),
        new QueryUserNameReviewedFoodInShoppingCenter(),
        //9
        new QueryCompareBeautyChainedRatingInCity(),
        new QueryCompareFoodChainedRatingInCity(),
        new QueryCompareShoppingChainedRatingInCity(),

        /**Query 8 */
        new QueryBusinessByCityAndRating(),
        new QueryBusinessByCity(),
    };
    
}