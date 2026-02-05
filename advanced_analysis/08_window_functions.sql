-- ======================================================
-- Window Function Analysis: Zepto E-commerce Data
-- ======================================================
-- Focus: Ranking, cumulative metrics, and category-level insights
-- SQL Level: Window Functions
-- ======================================================


-- Q1: Rank products within each category by highest discount
SELECT
    category,
    name,
    discountPercent,
    RANK() OVER (
        PARTITION BY category
        ORDER BY discountPercent DESC
    ) AS rank_in_category
FROM zepto;


-- Q2: Calculate cumulative revenue within each category
SELECT
    category,
    name,
    discountedSellingPrice * availableQuantity AS revenue,
    SUM(discountedSellingPrice * availableQuantity)
        OVER (
            PARTITION BY category
            ORDER BY discountedSellingPrice DESC
        ) AS running_revenue
FROM zepto;


-- Q3: Get the single best discounted product per category
SELECT *
FROM (
    SELECT
        category,
        name,
        discountPercent,
        ROW_NUMBER() OVER (
            PARTITION BY category
            ORDER BY discountPercent DESC
        ) AS rn
    FROM zepto
) ranked_products
WHERE rn = 1;
