with 

	offer_completed_table as (
		select  o1.customer_id  cust1, count(*)  no_of_offers_completed 
		from offer_table o1 
		join offer_table o2
		on o1.customer_id = o2.customer_id and 
		o1.offer_id = o2.offer_id and
		o2.event = 'offer_completed' and 
		o1.event = 'offer_received'
		group by o1.customer_id),

	offer_received_table as (
		select customer_id, count(*) no_of_offers_received
		from offer_table 
		where event = 'offer_received'
		and customer_id in (select distinct cust1 from offer_completed_table)
		group by customer_id)

select cust1, 100.0*no_of_offers_completed/no_of_offers_received as completion_percent
into customer_offer_completion_rate_table
from offer_completed_table join offer_received_table 
on cust1 = offer_received_table.customer_id 
order by completion_percent desc