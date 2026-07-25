/*
Question:
What is the session-to-order conversion rate? How has it trended over time?
Purpose:
To evaluate how effectively the website converts visitors into paying customers month-over-month or week-over-week.
*/
    SELECT
    DATE_TRUNC('month',website_sessions.created_at)::DATE AS create_month,
   count(DISTINCT website_sessions.website_session_id)AS total_vists,
    COUNT( DISTINCT orders.order_id) AS total_orders,
    ROUND(
             COUNT( DISTINCT orders.order_id) * 100.0 /COUNT(DISTINCT website_sessions.website_session_id),
             2
    ) AS conv_rate
    FROM website_sessions
    LEFT JOIN orders ON website_sessions.website_session_id = orders.website_session_id
    GROUP BY 1
    ORDER BY 1
    LIMIT 50;