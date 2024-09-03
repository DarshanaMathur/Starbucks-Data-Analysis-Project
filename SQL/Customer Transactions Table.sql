SELECT 
	age,
	gender,
	customer_id,
	member_since,
	income,
	event,
	hours_passed,
	offer_id_or_amount,
	round(try_cast(value_amt as float),0) as amount
INTO trans_table
FROM customer_trans
WHERE TRY_CAST(value_amt AS FLOAT) IS NOT NULL;
