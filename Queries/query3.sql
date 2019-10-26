select businessView.name from businessView, business_location, business_checkin, food 
where businessView.id = food.id and businessView.id = business_location.id and businessView.id = business_checkin.id and business_location.postal_code = 89109 and business_checkin.date between 2010-1-1 and 2011-1-1
group by business_checkin.id
order by count(*) desc
