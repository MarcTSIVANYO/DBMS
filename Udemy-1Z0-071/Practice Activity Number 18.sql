-- 1. Add an extra column which shows the total of the Actual_Cost to date.
SELECT Transaction_Date, Actual_Cost, ROUND( SUM(Actual_Cost) OVER(),2)
FROM PTBL_TRANSACTION
ORDER BY Transaction_Date;

SELECT Transaction_Date, Actual_Cost,   SUM(Actual_Cost) OVER(ORDER BY Transaction_Date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as Total_Actual_Cost_By_Date
FROM PTBL_TRANSACTION
ORDER BY Transaction_Date;

--2. Add another extra column which shows the total Month-to-Date Actual_Cost (so that, when a new month starts, it resets).
SELECT Transaction_Date, Actual_Cost, 

        SUM(Actual_Cost) OVER( 
        PARTITION BY TO_CHAR(Transaction_Date, 'YYMM')
        ORDER BY Transaction_Date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) as Total_Actual_Cost_To_Date,
        
        SUM(Actual_Cost) OVER( 
        PARTITION BY TO_CHAR(Transaction_Date, 'YYMM')
        ORDER BY Transaction_Date
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        ) as Total_Actual_Cost_To_Month,
        ROUND(
        Actual_Cost/
        SUM(Actual_Cost) OVER( 
        PARTITION BY TO_CHAR(Transaction_Date, 'YYMM')
        ORDER BY Transaction_Date
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        ) *100,3) as Actual_Cost_To_Month_PER,
         ROUND(
        SUM(Actual_Cost) OVER( 
        PARTITION BY TO_CHAR(Transaction_Date, 'YYMM')
        ORDER BY Transaction_Date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        )/
        SUM(Actual_Cost) OVER( 
        PARTITION BY TO_CHAR(Transaction_Date, 'YYMM')
        ORDER BY Transaction_Date
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        ) *100,3) as Total_Actual_Cost_To_Month_PER
FROM PTBL_TRANSACTION
ORDER BY Transaction_Date;