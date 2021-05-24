SELECT reference_order_id, SUM(quantity) as Total_Quantity, SUM(actual_cost) as Total_Actual_Cost, COUNT(*) as Number_of_Transactions
FROM ptbl_transaction
GROUP BY reference_order_id
HAVING COUNT(*)>10
ORDER BY reference_order_id;