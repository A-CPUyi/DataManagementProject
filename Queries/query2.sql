select businessView.name, goodReview.count, badReview.count from businessView, 
             (select review.business_id b_id, count(review.business_id) count from review,
             (select business_location.id as b_id
             from business_location, food
             where business_location.postal_code = 89109
             and business_location.id = food.id) as temp1
             where review.business_id = temp1.b_id
             and review.stars > 3.0
             group by review.business_id) as goodReview,
             (select review.business_id b_id, count(review.business_id) count from review, 
             (select business_location.id as b_id
             from business_location, food
             where business_location.postal_code = 89109
             and business_location.id = food.id) as temp1
             where review.business_id = temp1.b_id
             and review.stars <= 3.0
             group by review.business_id) as badReview
             where goodReview.b_id = badReview.b_id
             and (goodReview.count - badReview.count) > 0
             and businessView.id = goodReview.b_id
