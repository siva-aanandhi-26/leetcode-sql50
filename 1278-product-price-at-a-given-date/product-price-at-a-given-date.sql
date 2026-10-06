WITH RankedPrices AS (
    SELECT 
        product_id,
        new_price,
        ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY change_date DESC) as rn
    FROM Products
    WHERE change_date <= '2019-08-16'
)
SELECT 
    all_products.product_id,
    COALESCE(rp.new_price, 10) AS price
FROM (SELECT DISTINCT product_id FROM Products) all_products
LEFT JOIN RankedPrices rp 
    ON all_products.product_id = rp.product_id AND rp.rn = 1;
