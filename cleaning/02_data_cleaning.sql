-- =====================================
-- Data Cleaning: Zepto E-commerce Data
-- =====================================

-- 1. Identify products with invalid pricing
SELECT *
FROM zepto
WHERE mrp = 0
   OR discountedSellingPrice = 0;

-- 2. Remove products with zero MRP
DELETE FROM zepto
WHERE mrp = 0;

-- 3. Convert prices from paise to rupees
UPDATE zepto
SET
    mrp = mrp / 100.0,
    discountedSellingPrice = discountedSellingPrice / 100.0;

-- 4. Verify price conversion
SELECT
    mrp,
    discountedSellingPrice
FROM zepto
LIMIT 10;

-- 5. Final data sanity check
SELECT
    COUNT(*) AS total_rows,
    COUNT(mrp) AS valid_mrp,
    COUNT(discountedSellingPrice) AS valid_discounted_price
FROM zepto;
