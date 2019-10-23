select A.u_id, B.u_id , count(*)from
(select review.business_id b_id, review.user_id u_id, review.stars stars from review, food
	where review.business_id = food.id limit 10000) as A,
(select review.business_id b_id, review.user_id u_id, review.stars stars from review, food
	where review.business_id = food.id limit 10000) as B
where A.b_id = B.b_id
 and A.stars = B.stars
 and A.u_id < B.u_id
group by A.u_id, B.u_id
having count(*) > 3