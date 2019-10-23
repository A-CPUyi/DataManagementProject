select business.business_name,highRating.num, lowRating.num from business,
	(select basic.b_id b_id, count(basic.stars) num from
		(select reviewed.b_id b_id, reviewed.stars stars from
			(select friends_with.user_id2 u_id from friends_with where friends_with.user_id1 = '__2Xu2F0Z1gAodYpIdOsCQ') as friend,
			(select review.user_id u_id, review.business_id b_id, review.stars stars 
				from review, food 
				where review.business_id = food.id
				) as reviewed
			where friend.u_id = reviewed.u_id) as basic
		where basic.stars >= 4.0
		group by basic.b_id) as highRating,
	(select basic.b_id b_id, count(basic.stars) num from
		(select reviewed.b_id b_id, reviewed.stars stars from
			(select friends_with.user_id2 u_id from friends_with where friends_with.user_id1 = '__2Xu2F0Z1gAodYpIdOsCQ') as friend,
			(select review.user_id u_id, review.business_id b_id, review.stars stars 
				from review, food 
				where review.business_id = food.id
				) as reviewed
			where friend.u_id = reviewed.u_id) as basic
		where basic.stars < 4.0
		group by basic.b_id) as lowRating
where highRating.b_id = lowRating.b_id
and highRating.num > lowRating.num
and business.id = highRating.b_id