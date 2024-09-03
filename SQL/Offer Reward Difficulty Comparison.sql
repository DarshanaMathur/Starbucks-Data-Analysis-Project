select 
	offer_type, 
	round(avg(reward),2) 'avg discount ($)', 
	round(avg(difficulty),2) 'avg spend ($)', 
	count(*) as no_of_offers_given
from offer_table
where event = 'offer_completed'
group by offer_type