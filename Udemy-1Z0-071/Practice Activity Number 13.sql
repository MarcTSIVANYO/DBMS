--1. There are some Product_ID in the table ptbl_Product where have not had any transactions. Please find them.
SELECT *
FROM PTBL_PRODUCT P
LEFT JOIN PTBL_TRANSACTION T
ON (p.product_id=t.product_id)
--USING(PRODUCT_ID)
WHERE t.product_id IS NULL;

--2. I've made a mistake with the Transaction_Date. They are in 2013 and 2014, whereas they should be 10 years later (2023 and 2024). Please update the Transaction_Date. Then ROLLBACK. If you need a reminder of the function to be used, please scroll down.

--START TRANSACTION;

SELECT COUNT(*) FROM PTBL_TRANSACTION;

UPDATE PTBL_TRANSACTION
SET TRANSACTION_DATE= ADD_MONTHS(TRANSACTION_DATE,120)
WHERE EXTRACT(YEAR FROM TRANSACTION_DATE) IN (2013,2014);

SELECT *
 FROM PTBL_TRANSACTION;

--3. All of the transactions with a date of 31 July 2013 was dummy data. Please delete them.
 DELETE FROM PTBL_TRANSACTION
 WHERE TRANSACTION_DATE >= TO_DATE('2013-07-31','YYYY-MM-DD');
 
SELECT *
 FROM PTBL_TRANSACTION
 WHERE TRANSACTION_DATE >= TO_DATE('2013-07-31','YYYY-MM-DD');

ROLLBACK;


 
 SELECT ADD_MONTHS(TRANSACTION_DATE,120)
 FROM PTBL_TRANSACTION
 WHERE EXTRACT(YEAR FROM TRANSACTION_DATE) IN (2013,2014);