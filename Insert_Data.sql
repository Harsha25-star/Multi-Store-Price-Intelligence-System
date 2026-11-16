
USE smart_shopping_tracker;

-- 1. Insert products
INSERT INTO products
(product_name, brand, category, description)
VALUES
('Samsung Galaxy M35', 'Samsung', 'Mobiles', '5G Smartphone'),
('iPhone 15', 'Apple', 'Mobiles', 'Apple Smartphone'),
('HP Pavilion Laptop', 'HP', 'Laptops', 'Personal Laptop'),
('Boat Rockerz 450', 'Boat', 'Headphones', 'Wireless Headphones'),
('Samsung 1TB SSD', 'Samsung', 'Storage', 'External Storage');

-- 2. Insert stores
INSERT INTO stores
(store_name, location, delivery_fee, minimum_order_amount)
VALUES
('Amazon', 'Hyderabad', 50, 500),
('Flipkart', 'Hyderabad', 40, 400),
('Reliance Digital', 'Hyderabad', 60, 1000);

-- 3. Insert current prices
INSERT INTO product_prices
(product_id, store_id, current_price, is_available)
VALUES
(1,1,18000,TRUE), (1,2,17500,TRUE), (1,3,18500,TRUE),
(2,1,55000,TRUE), (2,2,54000,TRUE), (2,3,56000,TRUE),
(3,1,58000,TRUE), (3,2,56500,TRUE), (3,3,59000,TRUE),
(4,1,1500,TRUE),  (4,2,1400,TRUE),  (4,3,1600,TRUE),
(5,1,6500,TRUE),  (5,2,6200,TRUE),  (5,3,6800,TRUE);

-- 4. Insert historical prices
INSERT INTO price_history
(product_id, store_id, price, recorded_date)
VALUES
(1,1,19000,'2026-10-01'),
(1,1,18500,'2026-10-15'),
(1,1,18000,'2026-11-01'),
(1,2,18000,'2026-10-01'),
(1,2,17800,'2026-10-15'),
(1,2,17500,'2026-11-01'),

(2,1,57000,'2026-10-01'),
(2,1,56000,'2026-10-15'),
(2,1,55000,'2026-11-01'),
(2,2,55000,'2026-10-01'),
(2,2,54500,'2026-10-15'),
(2,2,54000,'2026-11-01'),

(3,1,60000,'2026-10-01'),
(3,1,59000,'2026-10-15'),
(3,1,58000,'2026-11-01'),
(3,2,57000,'2026-10-01'),
(3,2,56800,'2026-10-15'),
(3,2,56500,'2026-11-01'),

(4,1,1600,'2026-10-01'),
(4,1,1550,'2026-10-15'),
(4,1,1500,'2026-11-01'),
(4,2,1500,'2026-10-01'),
(4,2,1450,'2026-10-15'),
(4,2,1400,'2026-11-01'),

(5,1,7000,'2026-10-01'),
(5,1,6700,'2026-10-15'),
(5,1,6500,'2026-11-01'),
(5,2,6500,'2026-10-01'),
(5,2,6400,'2026-10-15'),
(5,2,6200,'2026-11-01');

-- 5. Insert discounts
INSERT INTO discounts
(product_id, store_id, original_price,
 advertised_discount_percentage, offer_start, offer_end)
VALUES
(1,1,22000,18,'2026-11-01','2026-11-30'),
(2,2,60000,10,'2026-11-01','2026-11-20'),
(3,1,65000,12,'2026-11-01','2026-11-25'),
(4,2,2000,30,'2026-11-01','2026-11-15'),
(5,3,8000,15,'2026-11-01','2026-11-30');

-- 6. Insert users
INSERT INTO users
(user_name, email, monthly_budget)
VALUES
('Harsha','harsha@example.com',10000),
('Asha','asha@example.com',15000),
('Rahul','rahul@example.com',20000);

-- 7. Insert wishlist
INSERT INTO wishlist
(user_id, product_id, target_price)
VALUES
(1,1,17000),
(1,3,55000),
(2,2,52000),
(3,4,1300);

-- 8. Insert shopping baskets
INSERT INTO shopping_basket
(user_id, basket_date, basket_name)
VALUES
(1,'2026-11-12','Monthly Shopping'),
(2,'2026-11-12','Electronics Shopping'),
(3,'2026-11-12','Personal Shopping');

-- 9. Insert basket items
INSERT INTO basket_items
(basket_id, product_id, quantity)
VALUES
(1,1,1),
(1,4,2),
(1,5,1),
(2,2,1),
(2,3,1),
(3,1,1),
(3,4,1);

-- Check the inserted data
SELECT * FROM products;
SELECT * FROM stores;
SELECT * FROM product_prices;
SELECT * FROM price_history;
SELECT * FROM discounts;
SELECT * FROM users;
SELECT * FROM wishlist;
SELECT * FROM shopping_basket;
SELECT * FROM basket_items;
