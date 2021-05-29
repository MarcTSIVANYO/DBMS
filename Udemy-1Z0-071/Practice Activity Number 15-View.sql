-- 1-Create a view pView_by_Category based on the following SQL code:
CREATE VIEW pView_by_Category 
AS 
SELECT category_name, subcategory_name
     , SUM(quantity) AS total_quantity
FROM ptbl_category
NATURAL LEFT JOIN ptbl_subcategory
NATURAL LEFT JOIN ptbl_product
NATURAL LEFT JOIN ptbl_transaction
GROUP BY category_name, subcategory_name
ORDER BY category_name, subcategory_name;

select * from pView_by_Category;


2--Alter this view so that the following is also in the SELECT clause:
CREATE OR REPLACE VIEW pView_by_Category 
AS 
SELECT category_name, subcategory_name , SUM(quantity) AS total_quantity, SUM(actual_cost) AS total_actual_cost
FROM ptbl_category
NATURAL LEFT JOIN ptbl_subcategory
NATURAL LEFT JOIN ptbl_product
NATURAL LEFT JOIN ptbl_transaction
GROUP BY category_name, subcategory_name
ORDER BY category_name, subcategory_name;

select * from pView_by_Category;

--3. Change the view so that total_actual_cost is invisible.
CREATE OR REPLACE VIEW pView_by_Category (category_name, subcategory_name,total_quantity, total_actual_cost INVISIBLE)
AS 
SELECT category_name, subcategory_name , SUM(quantity) AS total_quantity, SUM(actual_cost)  AS total_actual_cost 
FROM ptbl_category
NATURAL LEFT JOIN ptbl_subcategory
NATURAL LEFT JOIN ptbl_product
NATURAL LEFT JOIN ptbl_transaction
GROUP BY category_name, subcategory_name
ORDER BY category_name, subcategory_name;

select * from pView_by_Category;