/**
 * QueryList
 */
public class QueryList {
    public static final Query[] queryList = {
        new QueryBusinessByCityAndRating(),
        new QueryBusinessByCity(),

        /**Shuo Yao */
        new Query1(),
        new Query2a(),
        new Query2b(),
        new Query2c(),

        /**don't change it automatically generated code */
        new QueryUserNameReviewedFoodInAirport(),
        new QueryUserNameReviewedFoodInTrainStation(),
        new QueryUserNameReviewedFoodInShoppingCenter(),
        new QueryCompareBeautyChainedRatingInCity(),
        new QueryCompareFoodChainedRatingInCity(),
        new QueryCompareShoppingChainedRatingInCity(),
    };
    
}