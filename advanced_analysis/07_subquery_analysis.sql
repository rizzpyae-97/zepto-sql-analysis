-- ======================================================
-- Subquery Analysis: Zepto E-commerce Data
-- ======================================================
-- Focus: Comparing product pricing against overall metrics
-- SQL Level: Subqueries
-- ======================================================


-- Q1: Products priced higher than the average MRP of all products
SELECT
    name,
    mrp
FROM zepto
WHERE mrp > (
    SELECT AVG(mrp)
    FROM zepto
)
ORDER BY mrp DESC;
