-- ======================================================
-- Pricing and Inventory Analysis: Zepto E-commerce Data
-- ======================================================
-- Focus: Stock availability, pricing risks, inventory value
-- SQL Level: WHERE, ORDER BY, CASE, basic comparisons
-- ======================================================


-- Q1: High-priced products that are currently out of stock
SELECT
    name,
    category,
    mrp
FROM zepto
WHERE outOfStock = TRUE
  AND mrp > 300
ORDER BY mrp DESC;


-- Q2: Products priced higher than the overall average MRP
SELECT
    name,
    category,
    mrp
FROM zepto
WHERE mrp > (
    SELECT AVG(mrp)
    FROM zepto
)
ORDER BY mrp DESC;


-- Q3: Inventory value by product (price × quantity)
SELECT
    name,
    category,
    discountedSellingPrice,
    availableQuantity,
    discountedSellingPrice * availableQuantity AS inventory_value
FROM zepto
ORDER BY inventory_value DESC;


-- Q4: Identify low-discount products with high pricing risk
-- (High MRP but discount less than 10%)
SELECT
    name,
    category,
    mrp,
    discountPercent
FROM zepto
WHERE mrp > 500
  AND discountPercent < 10
ORDER BY mrp DESC;


-- Q5: Stock availability summary by category
SELECT
    category,
    outOfStock,
    COUNT(sku_id) AS product_count
FROM zepto
GROUP BY category, outOfStock
ORDER BY category, outOfStock;
