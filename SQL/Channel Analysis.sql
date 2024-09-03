select 
	event, 
	sum(channel_mobile) as channel_mobile, 
	sum(channel_web) as channel_web, 
	sum(channel_email) as channel_email, 
	sum(channel_social) as channel_social 
from customer_trans
group by event
having event in ('offer_received','offer_completed','offer_viewed')