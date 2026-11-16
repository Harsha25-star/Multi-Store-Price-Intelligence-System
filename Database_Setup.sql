
CREATE DATABASE IF NOT EXISTS smart_shopping_tracker;

USE smart_shopping_tracker;

-- 1. Products
CREATE TABLE IF NOT EXISTS products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    brand VARCHAR(50),
    category VARCHAR(50),
    description VARCHAR(200)
);

-- 2. Stores
CREATE TABLE IF NOT EXISTS stores (
    store_id INT PRIMARY KEY AUTO_INCREMENT,
    store_name VARCHAR(100),
    location VARCHAR(100),
    delivery_fee DECIMAL(10,2),
    minimum_order_amount DECIMAL(10,2)
);

-- 3. Current product prices
CREATE TABLE IF NOT EXISTS product_prices (
    price_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    store_id INT,
    current_price DECIMAL(10,2),
    is_available BOOLEAN DEFAULT TRUE,
    last_updated DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (store_id) REFERENCES stores(store_id),
    UNIQUE (product_id, store_id)
);

-- 4. Price history
CREATE TABLE IF NOT EXISTS price_history (
    history_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    store_id INT,
    price DECIMAL(10,2),
    recorded_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (store_id) REFERENCES stores(store_id)
);

-- 5. Discounts
CREATE TABLE IF NOT EXISTS discounts (
    discount_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    store_id INT,
    original_price DECIMAL(10,2),
    advertised_discount_percentage DECIMAL(5,2),
    offer_start DATE,
    offer_end DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (store_id) REFERENCES stores(store_id)
);

-- 6. Users
CREATE TABLE IF NOT EXISTS users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    monthly_budget DECIMAL(10,2)
);

-- 7. Wishlist
CREATE TABLE IF NOT EXISTS wishlist (
    wishlist_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    product_id INT,
    target_price DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    UNIQUE (user_id, product_id)
);

-- 8. Shopping basket
CREATE TABLE IF NOT EXISTS shopping_basket (
    basket_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    basket_date DATE,
    basket_name VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- 9. Basket items
CREATE TABLE IF NOT EXISTS basket_items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    basket_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (basket_id) REFERENCES shopping_basket(basket_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    UNIQUE (basket_id, product_id)
);

SHOW TABLES;
