/*
Question:
What is the trend in website sessions and order volume over time?

Purpose:
To understand the overall growth traffic and sales volume trajectory of the business.
*/

SELECT 
COUNT(website_sessions.website_session_id) AS total_sessions,
DATE_TRUNC('month',website_sessions.created_at)::DATE AS create_month,
DATE_TRUNC('year',website_sessions.created_at)::DATE AS create_year,
COUNT(orders.website_session_id) AS total_orders

FROM website_sessions
LEFT JOIN orders ON website_sessions.website_session_id = orders.website_session_id
GROUP BY 2,3
ORDER BY create_year,create_month
LIMIT 100 ;
