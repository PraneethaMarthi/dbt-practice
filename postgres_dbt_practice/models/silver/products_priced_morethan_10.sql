SELECT product_id, product_name, category, price, stock, brand, discount_percentage, supplier_id
FROM bronze.products
WHERE price > 10
