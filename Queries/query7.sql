select user_name from located_in, food, review, user 
where located_in.location_type = \"airport\" and located_in.business_id = food.id and review.business_id = located_in.business_id and review.review_date between 2010-1-1 and 2011-1-1 and user.user_id = review.user_id
group by user.user_id
