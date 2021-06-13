--1. Without using a join, alter the SELECT statement so that it only displays that products which are in Category 1. (Hint: use ptbl_Subcategory in the subquery.)
SELECT product_id, product_name, product_subcategory_id
FROM ptbl_product
WHERE PRODUCT_SUBCATEGORY_ID IN (SELECT  PRODUCT_SUBCATEGORY_ID FROM PTBL_SUBCATEGORY  WHERE  product_category_id=1);

--2. Expand the original SELECT statement so that there is an additional column which shows the MIN(Transaction_Date) for that product. (Use the field from ptbl_Transaction in the SELECT clause.)
SELECT product_id, product_name, product_subcategory_id,
(SELECT  MIN(Transaction_Date) FROM PTBL_TRANSACTION WHERE PRODUCT_ID=P.PRODUCT_ID) as Min_Transaction_Date
FROM ptbl_product P;

--3. Expand this original SELECT statement so that it only shows all products which have had at least 1 transaction (from ptbl_Transaction). Don't use a JOIN.
SELECT product_id, product_name, product_subcategory_id
FROM ptbl_product P
WHERE EXISTS (SELECT DISTINCT product_id 
                FROM PTBL_TRANSACTION T WHERE t.product_id=p.product_id )