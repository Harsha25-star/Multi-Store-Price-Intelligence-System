
USE smart_shopping_tracker;

-- 1. Display product prices in all stores

SELECT 
    p.product_name,
    s.store_name,
    pp.current_price
FROM products p
JOIN product_prices pp
ON p.product_id = pp.product_id
JOIN stores s
ON pp.store_id = s.store_id;


-- 2. Find the cheapest store for each product

SELECT 
    p.product_name,
    s.store_name,
    pp.current_price
FROM products p
JOIN product_prices pp
ON p.product_id = pp.product_id
JOIN stores s
ON pp.store_id = s.store_id
WHERE pp.current_price = (
    SELECT MIN(pp2.current_price)
    FROM product_prices pp2
    WHERE pp2.product_id = p.product_id
);


-- 3. Find the highest price for each product

SELECT 
    p.product_name,
    MAX(pp.current_price) AS highest_price
FROM products p
JOIN product_prices pp
ON p.product_id = pp.product_id
GROUP BY p.product_id, p.product_name;


-- 4. Calculate potential savings for each product

SELECT 
    p.product_name,
    MAX(pp.current_price) AS highest_price,
    MIN(pp.current_price) AS lowest_price,
    MAX(pp.current_price) - MIN(pp.current_price) AS potential_savings
FROM products p
JOIN product_prices pp
ON p.product_id = pp.product_id
GROUP BY p.product_id, p.product_name;


-- 5. Calculate average price of each product

SELECT 
    p.product_name,
    ROUND(AVG(pp.current_price), 2) AS average_price
FROM products p
JOIN product_prices pp
ON p.product_id = pp.product_id
GROUP BY p.product_id, p.product_name;
