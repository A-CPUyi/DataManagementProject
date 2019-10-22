/**
 * QueryList
 */
public class QueryList {
    public static final Query[] queryList = {
        new QueryBusinessByCityAndRating(),
        new QueryBusinessByCity(),

        /**don't change it automatically generated code */
        new QueryUserNameReviewedFoodInAirport(),
        new QueryUserNameReviewedFoodInTrainStation(),
        new QueryUserNameReviewedFoodInShoppingCenter(),
        new QueryCompareBeautyChainedRatingInCity(),
        new QueryCompareFoodChainedRatingInCity(),
        new QueryCompareShoppingChainedRatingInCity(),
    };
    
}