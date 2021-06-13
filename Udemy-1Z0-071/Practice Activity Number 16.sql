--1. when you combine the two sets together, including duplicates. Result :  382
SELECT transaction_id, quantity, actual_cost
FROM ptbl_transaction
WHERE MOD(quantity, 3) = 0

UNION ALL

SELECT transaction_id, quantity, actual_cost
FROM ptbl_transaction
WHERE quantity>=8;

--2. when you combine the two sets together, excluding duplicates. Result 313
SELECT transaction_id, quantity, actual_cost
FROM ptbl_transaction
WHERE MOD(quantity, 3) = 0

UNION 

SELECT transaction_id, quantity, actual_cost
FROM ptbl_transaction
WHERE quantity>=8;

--3. in the first set which are also in the second set. Result 69
SELECT transaction_id, quantity, actual_cost
FROM ptbl_transaction
WHERE MOD(quantity, 3) = 0

INTERSECT

SELECT transaction_id, quantity, actual_cost
FROM ptbl_transaction
WHERE quantity>=8;

--4. in the first set but not in the second set. Result 112
SELECT transaction_id, quantity, actual_cost
FROM ptbl_transaction
WHERE MOD(quantity, 3) = 0

MINUS

SELECT transaction_id, quantity, actual_cost
FROM ptbl_transaction
WHERE quantity>=8;

--5. in the second set but not in the first set. Result 132
SELECT transaction_id, quantity, actual_cost
FROM ptbl_transaction
WHERE quantity>=8

MINUS

SELECT transaction_id, quantity, actual_cost
FROM ptbl_transaction
WHERE MOD(quantity, 3) = 0;

--6. Go back to your code for number 4 above (the first set but not in the second set). Change the quantity in the second set so that the user is prompted with the question "What is the minimum quantity for Set 2?"
ACCEPT What_is_the_minimum_quantity_for_Set_2 PROMPT 'What is the minimum quantity for Set 2?';

SELECT transaction_id, quantity, actual_cost
FROM ptbl_transaction
WHERE MOD(quantity, 3) = 0

MINUS

SELECT transaction_id, quantity, actual_cost
FROM ptbl_transaction
WHERE quantity>=&What_is_the_minimum_quantity_for_Set_2;

--7. There are some rows where the subcategory_name is NULL. Change the SELECT clause so that, when the subcategory_name is NULL, it says instead "No subcategory".

SELECT  coalesce(subcategory_name,'No subcategory') subcategory_name , count(Product_ID) as Number_Of_Records
FROM PTBL_PRODUCT
NATURAL LEFT JOIN PTBL_SUBCATEGORY
GROUP BY subcategory_name
ORDER BY subcategory_name;

--8. Add an extra column so that, when count(Product_ID) is 1, it says "Only one", otherwise it says "More than one".

SELECT  coalesce(subcategory_name,'No subcategory') subcategory_name , count(Product_ID) as Number_Of_Records,
CASE 
    WHEN count(Product_ID)=1
    THEN 'Only one'
    ELSE
    'More than one'
END as Status_Of_Records
FROM PTBL_PRODUCT
NATURAL LEFT JOIN PTBL_SUBCATEGORY
GROUP BY subcategory_name
ORDER BY subcategory_name;