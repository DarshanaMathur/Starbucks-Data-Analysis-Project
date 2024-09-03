with channel_analysis as (
	select 
		event, 
		sum(channel_mobile) as channel_mobile, 
		sum(channel_web) as channel_web, 
		sum(channel_email) as channel_email, 
		sum(channel_social) as channel_social 
	from customer_trans
	group by event
	having event in ('offer_received','offer_completed','offer_viewed')
	)

SELECT 
	[channel], 
	[offer_received], 
	[offer_completed], 
	[offer_viewed],
	round(100*[offer_completed]/[offer_viewed],2) as 'completion_rate'
into channel_analysis
FROM
(
    SELECT event, 
           channel_mobile AS Value, 
           'channel_mobile' AS channel
    FROM channel_analysis
    UNION ALL
    SELECT event, 
           channel_web AS Value, 
           'channel_web' AS channel
    FROM channel_analysis
    UNION ALL
    SELECT event, 
           channel_email AS Value, 
           'channel_email' AS channel
    FROM channel_analysis
    UNION ALL
    SELECT event, 
           channel_social AS Value, 
           'channel_social' AS channel
    FROM channel_analysis
) AS SourceTable
PIVOT
(
    MAX(Value)
    FOR event IN ([offer_received], [offer_completed],[offer_viewed])
) AS PivotTable;
