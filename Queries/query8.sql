select name, rating from (SELECT businessView.name name, AVG(review.stars) as rating
FROM project1_main.review, business_location, project1_main.businessView 
where businessView.id = review.business_id and business_location.City = "New York" and business_location.id = businessView.id 
group by businessView.name) as temp where rating > 3.0

