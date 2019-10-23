select foodRate.u_id from
(select review.user_id u_id, avg(review.stars) foodAvg from food, review, business_location
	where food.id = review.business_id
    and business_location.postal_code = '89102'
    and business_location.id = food.id
    group by review.user_id) as foodRate,    
(select review.user_id u_id, avg(review.stars) shopAvg from shopping, review, business_location
	where shopping.id = review.business_id
    and business_location.postal_code = '89102'
    and business_location.id = shopping.id
    group by review.user_id) as shoppingRate
where foodRate.foodAvg > shoppingRate.shopAvg
and foodRate.u_id = shoppingRate.u_id