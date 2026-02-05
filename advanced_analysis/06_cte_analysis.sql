-- ======================================================
-- CTE Analysis: Zepto E-commerce Data
-- ======================================================
-- Focus: Improving query readability using CTEs
-- SQL Level: Common Table Expressions (WITH)
-- ======================================================


-- Q1: Top 10 highest discount products that are currently in stock
WITH in_stock_products AS (
    SELECT
        name,
        mrp,
        discountPercent
    FROM zepto
    WHERE outOfStock = FALSE
)

SELECT
    name,
    mrp,
    discountPercent
FROM in_stock_products
ORDER BY discountPercent DESC
LIMIT 10;
