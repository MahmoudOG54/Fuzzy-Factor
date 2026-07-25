# Maven Fuzzy Factory - E-commerce Database Analysis

# Introduction
Welcome to the **Maven Fuzzy Factory** SQL Data Analysis Project. In this project, I acted as a Lead Data Analyst for an e-commerce startup to evaluate business performance, analyze traffic acquisition sources, measure conversion rates, and track long-term revenue growth.

# Background
Maven Fuzzy Factory relies heavily on data-driven decision-making. As the business expanded, the management team required deep database insights to address key operational questions:
* Which marketing channels (`utm_source`, `utm_campaign`, `http_referer`) drive the most qualified traffic and highest sales?
* How are core monetary metrics—specifically **Average Order Value (AOV)** and **Revenue Per Session (RPS)**—evolving over time?
* Where should the marketing budget be allocated to maximize return on ad spend (ROAS)?

# Tools I Used
* **Code & Query Editor:** Visual Studio Code (VS Code)
* **Database Management System:** PostgreSQL
* **Version Control:** Git & GitHub

# The Analysis

### 1. Marketing Channel Performance Analysis
**Question:** Which marketing channels have been most successful in driving traffic, sales, and conversion rates?

```sql
SELECT
    website_sessions.utm_source,
    website_sessions.utm_campaign,
    website_sessions.http_referer,
    COUNT(DISTINCT website_sessions.website_session_id) AS total_visits,
    COUNT(DISTINCT orders.order_id) AS total_sales,
    ROUND(
        COUNT(DISTINCT orders.order_id) * 100.0 / COUNT(DISTINCT website_sessions.website_session_id),
        2
    ) AS conv_rate
FROM website_sessions
LEFT JOIN orders 
    ON website_sessions.website_session_id = orders.website_session_id
GROUP BY 1, 2, 3
ORDER BY total_visits DESC, total_sales DESC
LIMIT 20;
2. Revenue Evolution (AOV & RPS Metrics)
Question: How has the revenue per order (AOV) and revenue per website session (RPS) evolved monthly over time?

SQL
SELECT
    EXTRACT(YEAR FROM website_sessions.created_at) AS yr,
    EXTRACT(MONTH FROM website_sessions.created_at) AS mo,
    COUNT(DISTINCT website_sessions.website_session_id) AS total_visits,
    COUNT(DISTINCT orders.order_id) AS total_sales,
    SUM(orders.price_usd) AS total_revenue,
    ROUND(SUM(orders.price_usd) / COUNT(DISTINCT orders.order_id), 2) AS AOV,
    ROUND(SUM(orders.price_usd) / COUNT(DISTINCT website_sessions.website_session_id), 2) AS RPS
FROM website_sessions
LEFT JOIN orders 
    ON website_sessions.website_session_id = orders.website_session_id
GROUP BY 1, 2
ORDER BY 1, 2;
What I Learned
Through hands-on querying and schema exploration on PostgreSQL using VS Code, I refined several technical and business analytical skills:

PostgreSQL Timestamp Extraction: Utilized EXTRACT(YEAR/MONTH FROM ...) for accurate time-series trends analysis in PostgreSQL environments.

Business KPI Modeling: Calculated key e-commerce performance indicators including Session-to-Order Conversion Rate, Average Order Value (AOV), and Revenue Per Session (RPS).

Relational Joins & Aggregations: Applied LEFT JOIN logic to retain non-converting sessions while accurately joining relational order data.

Conclusions
Dominant Acquisition Channels: Paid search via gsearch nonbrand accounts for the largest volume of website traffic and orders, making it the primary channel for budget optimization.

Improving Monetary Efficiency: Both AOV and RPS demonstrated steady upward growth over time, proving that cross-selling initiatives and user experience improvements have successfully increased customer value.

Strategic Recommendations: Continue scaling investment in top-performing paid channels while testing landing page variations to improve conversion rates on lower-performing traffic sources.
