SELECT 
	age,
	gender,
	customer_id,
	member_since,
	income,
	event,
	hours_passed,
	offer_id_or_amount,
	value_amt as offer_id,
	reward,
	difficulty,
	duration, 
	offer_type,
	channel_web,
	channel_mobile,
	channel_email,
	channel_social
INTO offer_table
FROM customer_trans
WHERE TRY_CAST(value_amt AS FLOAT) IS NULL;
