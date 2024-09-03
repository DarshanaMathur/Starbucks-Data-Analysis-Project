select age_groups, count( distinct customer_id) as counts
from (select *,
	case 
		when age <= 18 then '18'
		when age > 18 and age <= 30 then '18 to 30'
		when age > 30 and age <= 45 then '30 to 45'
		when age > 45 and age <= 60 then '45 to 60'
		when age > 60 then '60+'
	end as age_groups
from customer_trans ) as cte
group by age_groups
