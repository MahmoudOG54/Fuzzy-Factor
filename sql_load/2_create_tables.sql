-- 1. Website Sessions Table
CREATE TABLE website_sessions (
    website_session_id INT PRIMARY KEY,
    created_at TIMESTAMP,
    user_id INT,
    is_repeated_session INT,
    utm_source VARCHAR(50),
    utm_campaign VARCHAR(50),
    utm_content VARCHAR(50),
    device_type VARCHAR(50),
    http_referer VARCHAR(255)
);

-- 2. Website Pageviews Table
CREATE TABLE website_pageviews (
    website_pageview_id INT PRIMARY KEY,
    created_at TIMESTAMP,
    website_session_id INT,
    pageview_url VARCHAR(100)
);

-- 3. Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    created_at TIMESTAMP,
    product_name VARCHAR(100)
);

-- 4. Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    created_at TIMESTAMP,
    user_id INT,
    website_session_id INT,
    primary_product_id INT,
    items_purchased INT,
    price_usd NUMERIC(10, 2),
    cogs_usd NUMERIC(10, 2)
);

-- 5. Order Items Table
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    created_at TIMESTAMP,
    order_id INT,
    product_id INT,
    is_primary_item INT,
    price_usd NUMERIC(10, 2),
    cogs_usd NUMERIC(10, 2)
);

-- 6. Order Item Refunds Table
CREATE TABLE order_item_refunds (
    order_item_refund_id INT PRIMARY KEY,
    created_at TIMESTAMP,
    order_item_id INT,
    order_id INT,
    refund_amount_usd NUMERIC(10, 2)
);