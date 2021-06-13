--1. Display only the 5th row, using the WITH clause.
WITH product AS(
    SELECT product_id, product_name, product_subcategory_id, ROW_NUMBER() OVER (ORDER BY product_id) as RowNumber
    FROM ptbl_product
)
SELECT * 
FROM product 
WHERE RowNumber=5;

--2. Display only the 5th row, using the FETCH clause.
SELECT product_id, product_name, product_subcategory_id, rownum as RowNumber
    FROM ptbl_product
    OFFSET 4 ROW FETCH NEXT 1 ROW ONLY;
    
--3. Display a list of numbers from 1 to 999, and the product_name if it exists for that product_id.
WITH Numbers as(
    SELECT  rownum as My_Number   FROM obj$  FETCH FIRST 999 ROW ONLY)
SELECT My_Number, Product_name
FROM Numbers N
LEFT JOIN PTBL_PRODUCT P
ON N.My_Number=P.product_id;
