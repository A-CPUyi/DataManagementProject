select business_chain.is_chain, avg(review.stars) from business_location, food, businessView, business_chain, review
where business_location.city = "New York"  and food.id = business_location.id and food.id = businessView.id and businessView.name = business_chain.business_name and business_location.id = review.business_id
group by business_chain.is_chain