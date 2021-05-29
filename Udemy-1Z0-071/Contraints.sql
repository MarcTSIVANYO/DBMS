SELECT d.department_head, SUM(AMOUNT) as SUM_OF_AMOUNT
FROM TBL_DEPARTMENT D
NATURAL LEFT JOIN TBL_EMPLOYEE E
--USING(department)
NATURAL LEFT JOIN TBL_TRANSACTION T
--USING(employee_number)
GROUP BY D.department_head;


ALTER TABLE TBL_TRANSACTION
ADD Date_Of_Entry TIMESTAMP(6) DEFAULT SYSDATE;

SELECT *
FROM TBL_TRANSACTION;


ALTER TABLE TBL_TRANSACTION
MODIFY Date_Of_Entry TIMESTAMP DEFAULT ON NULL SYSDATE;


ALTER TABLE TBL_TRANSACTION
ADD CONSTRAINT chkAmount CHECK (Amount>=-1000 AND Amount <1000);
 
alter table tbl_Employee
add constraint chkMiddleName check
(REPLACE(Employee_Middle_Name,'.','') = Employee_Middle_Name or Employee_Middle_Name is null)
enable novalidate;

insert into tbl_Employee
  values (2003, 'A', 'B.', 'C', 'D', TO_DATE('2014-01-01', 'YYYY-MM-DD'), 'Accounts');
  
  alter table tbl_Employee
drop constraint chkMiddleName;

alter table tbl_Employee
add constraint PK_tbl_Employee PRIMARY KEY (Employee_number);

ALTER TABLE tbl_Transaction 
ADD CONSTRAINT FK_tbl_Transaction_Employee_number FOREIGN KEY (Employee_number)
REFERENCES tbl_Employee(Employee_number);

ALTER TABLE TBL_TRANSACTION
MODIFY Employee_Number DECIMAL(4,0) NOT NULL;



