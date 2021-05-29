create view View_By_Department as 
select D.Department, T.Employee_number, T.Date_of_transaction, T.Amount as TotalAmount
from tbl_Department D
left join tbl_Employee E
on D.Department = E.Department
left join tbl_Transaction T
on E.Employee_number = T.Employee_number
where T.Employee_number between 120 and 139
order by D.Department, T.Employee_number;

SELECT * FROM View_By_Department;

create view View_Summary as 
select D.Department, T.Employee_number as EmpNum, sum(T.Amount) as TotalAmount
from tbl_Department D
left join tbl_Employee E
on D.Department = E.Department
left join tbl_Transaction T
on E.Employee_number = T.Employee_number
group by D.Department, T.Employee_number
order by D.Department, T.Employee_number;

select * from View_Summary;

--Altering and dropping views
DROP VIEW View_By_Department;

CREATE OR REPLACE view View_By_Department as 
select D.Department, T.Employee_number, T.Date_of_transaction, T.Amount as TotalAmount
from tbl_Department D
left join tbl_Employee E
on D.Department = E.Department
left join tbl_Transaction T
on E.Employee_number = T.Employee_number
where T.Employee_number between 120 and 139
order by D.Department, T.Employee_number;

--Adding Rows to Views
SET TRANSACTION NAME 'new_transaction';

insert into View_By_Department(Employee_number,Date_of_transaction,TotalAmount)
values (132,TO_DATE('2015-07-07', 'YYYY-MM-DD'), 999.99);

alter table TBL_DEPARTMENT
add constraint pk_tbl_department primary key (DEPARTMENT);

Select * from tbl_Transaction where Employee_number in (132,142);
ROLLBACK;

CREATE or REPLACE view View_By_Department as 
select D.Department, T.Employee_number, T.Date_of_transaction, T.Amount as Total_Amount
from tbl_Department D
left join tbl_Employee E
on D.Department = E.Department
left join tbl_Transaction T
on E.Employee_number = T.Employee_number
where T.Employee_number between 120 and 139
order by D.Department, T.Employee_number
WITH READ ONLY;

insert into View_By_Department(Employee_number,Date_of_transaction,Total_Amount)
values (132,TO_DATE('2015-07-07', 'YYYY-MM-DD'), 999.99);

ROLLBACK;

CREATE or REPLACE view View_By_Department as 
select T.Employee_number, T.Date_of_transaction, T.Amount as Total_Amount
from tbl_Transaction T
where T.Employee_number between 120 and 139
WITH CHECK OPTION CONSTRAINT constraint_View_By_Department;

update View_By_Department
set Employee_number = 142
where Employee_number = 132;

insert into View_By_Department(Employee_number,Date_of_transaction,Total_Amount)
values (142,TO_DATE('2015-07-07', 'YYYY-MM-DD'), 999.99);

delete from View_By_Department
where employee_number = 132;


