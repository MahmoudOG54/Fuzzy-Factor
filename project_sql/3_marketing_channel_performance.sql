/*
Question:
Which marketing channels have been most successful in driving traffic and sales?

Purpose:
To analyze utm_source, utm_campaign, and http_referer to identify high-performing marketing channels.
*/

SELECT
website_sessions.utm_source,
website_sessions.utm_campaign,
website_sessions.http_referer,
COUNT(DISTINCT website_sessions.website_session_id) AS total_visits,
COUNT(DISTINCT orders.order_id) AS total_sales,
ROUND(
            COUNT( DISTINCT orders.order_id) * 100.0 /COUNT(DISTINCT website_sessions.website_session_id),
            2
) AS conv_rate
FROM website_sessions
LEFT JOIN orders ON website_sessions.website_session_id = orders.website_session_id
GROUP BY 1,2,3
ORDER BY total_visits DESC,total_sales DESC
