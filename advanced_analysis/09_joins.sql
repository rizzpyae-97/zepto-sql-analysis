-- ======================================================
-- Join Analysis: Zepto E-commerce Data
-- ======================================================
-- Focus: Comparing products within the same category
-- SQL Level: Self Join
-- ======================================================


-- Q1: Identify products cheaper than other products in the same category
SELECT
    a.category,
    a.name AS cheaper_product,
    b.name AS expensive_product,
    a.discountedSellingPrice,
    b.discountedSellingPrice
FROM zepto a
JOIN zepto b
    ON a.category = b.category
   AND a.discountedSellingPrice < b.discountedSellingPrice
ORDER BY a.category;
