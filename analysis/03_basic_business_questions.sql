-- ======================================================
-- Basic Business Analysis: Zepto E-commerce Data
-- ======================================================
-- Focus: Pricing, discounts, inventory, and value metrics
-- SQL Level: WHERE, ORDER BY, CASE, basic calculations
-- ======================================================


-- Q1: Top 10 best-value products based on discount percentage
SELECT DISTINCT
    name,
    mrp,
    discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;


-- Q2: High-MRP products that are currently out of stock
SELECT
    name,
    mrp
FROM zepto
WHERE outOfStock = TRUE
  AND mrp > 300
ORDER BY mrp DESC;


-- Q3: Products with high MRP but low discount (< 10%)
SELECT DISTINCT
    name,
    mrp,
    discountPercent
FROM zepto
WHERE mrp > 500
  AND discountPercent < 10
ORDER BY mrp DESC,
         discountPercent DESC;


-- Q4: Best value products using price per gram (above 100g)
SELECT DISTINCT
    name,
    weightInGms,
    discountedSellingPrice,
    ROUND(discountedSellingPrice / weightInGms, 2) AS price_per_gram
FROM zepto
WHERE weightInGms >= 100
ORDER BY price_per_gram ASC;


-- Q5: Categorize products based on weight (Low / Medium / Bulk)
SELECT DISTINCT
    name,
    weightInGms,
    CASE
        WHEN weightInGms < 1000 THEN 'Low'
        WHEN weightInGms < 5000 THEN 'Medium'
        ELSE 'Bulk'
    END AS weight_category
FROM zepto;
