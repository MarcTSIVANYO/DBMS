--1. Add an extra column which shows the change from the previous month. 
SELECT TO_CHAR(Transaction_Date, 'YYYY-MM'),
        SUM(Actual_Cost) AS Total_Actual_Cost,
        LAG(SUM(Actual_Cost),1) 
            OVER (ORDER BY TO_CHAR(Transaction_Date, 'YYYY-MM')) 
            as Previous, 
        SUM(Actual_Cost) -  LAG(SUM(Actual_Cost),1) 
            OVER (ORDER BY TO_CHAR(Transaction_Date, 'YYYY-MM')) 
            as Change_Previous 
FROM PTBL_TRANSACTION
GROUP BY TO_CHAR(Transaction_Date, 'YYYY-MM')
ORDER BY TO_CHAR(Transaction_Date, 'YYYY-MM');

--2. Add an extra column which shows the change from the next month.
SELECT TO_CHAR(Transaction_Date, 'YYYY-MM'),
        SUM(Actual_Cost) AS Total_Actual_Cost,
        LEAD(SUM(Actual_Cost)) 
        OVER (ORDER BY TO_CHAR(Transaction_Date, 'YYYY-MM')) as Next_Month , 
        SUM(Actual_Cost) - LEAD(SUM(Actual_Cost)) 
        OVER (ORDER BY TO_CHAR(Transaction_Date, 'YYYY-MM')) as Change_Next
FROM PTBL_TRANSACTION
GROUP BY TO_CHAR(Transaction_Date, 'YYYY-MM')
ORDER BY TO_CHAR(Transaction_Date, 'YYYY-MM');


--3 & 4. Add an extra column which divides the rows in 10 tranches or "buckets".
SELECT Transaction_Date, Actual_Cost,
NTILE(10) OVER(PARTITION BY Transaction_Date ORDER BY  Actual_Cost) 
    AS Partition,
ROW_NUMBER() OVER(PARTITION BY Transaction_Date
                ORDER BY Actual_Cost) AS Row_Number,
RANK() OVER(PARTITION BY Transaction_Date
                ORDER BY Actual_Cost) AS Rank_Number,
DENSE_RANK() OVER(PARTITION BY Transaction_Date
                ORDER BY Actual_Cost) AS Dense_Rank_Number
FROM PTBL_TRANSACTION;

