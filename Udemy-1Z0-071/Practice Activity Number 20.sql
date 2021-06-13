--1. Please add subtotals for each Category_Name, and a grand total.
SELECT category_name, subcategory_name, SUM(actual_cost) AS total_actual_cost,
CASE GROUPING_ID(category_name, subcategory_name)
        WHEN 0 THEN 'Original Data '
        WHEN 1 THEN 'Subtotal '
        WHEN 3 THEN 'Grand Total ' END AS My_Group
FROM ptbl_transaction
NATURAL LEFT JOIN ptbl_product
NATURAL LEFT JOIN ptbl_subcategory
NATURAL LEFT JOIN ptbl_category
GROUP BY ROLLUP( category_name, subcategory_name)
ORDER BY category_name, subcategory_name;