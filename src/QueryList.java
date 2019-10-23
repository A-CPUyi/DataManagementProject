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
        new Query3a(),
        new Query3b(),
        new Query3c(),
        new Query5(),
        
        //4
        new QueryHigherRatedRestaurantsAmongFriends(),
        //6
        new QueryUserPreferFoodOverShopping(),
        new QueryUserPreferShoppingOverFood(),
        
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