/* 
Database Load Script for Linux 
Project: Maven Fuzzy Factory E-Commerce Analysis

NOTE: Using \copy instead of COPY to prevent "Permission Denied" errors on Linux, 
as \copy runs with your current user permissions rather than the postgres server account.
*/

COPY website_sessions FROM '/tmp/website_sessions.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
COPY website_pageviews FROM '/tmp/website_pageviews.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
COPY products FROM '/tmp/products.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
COPY orders FROM '/tmp/orders.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
COPY order_items FROM '/tmp/order_items.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
COPY order_item_refunds FROM '/tmp/order_item_refunds.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');