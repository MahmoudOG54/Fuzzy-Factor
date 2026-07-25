/*
Question:
How has the revenue per order evolved? What about revenue per session?
Purpose:
To measure monetary value changes by calculating Average Order Value (AOV) and revenue generated per website visit.
*/
SELECT
    EXTRACT(YEAR FROM website_sessions.created_at )AS yr,
    EXTRACT(MONTH FROM website_sessions.created_at)AS mo,
    COUNT(DISTINCT website_sessions.website_session_id) AS total_visits,
    COUNT(DISTINCT orders.order_id) AS total_sales,
    SUM(orders.price_usd) AS total_revenue,
    ROUND(SUM(orders.price_usd) / COUNT(DISTINCT orders.order_id), 2) AS AOV,
    ROUND(SUM(orders.price_usd) / COUNT(DISTINCT website_sessions.website_session_id), 2) AS RPS
FROM website_sessions
LEFT JOIN orders 
    ON website_sessions.website_session_id = orders.website_session_id
GROUP BY 1, 2
ORDER BY 1, 2
LIMIT 20;