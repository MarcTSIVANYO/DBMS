CREATE TABLE ptbl_Transaction (
Transaction_ID	NUMBER(6,0) NOT NULL, 
Product_ID	NUMBER (10) NOT NULL,
Reference_Order_ID	NUMBER (10) NOT NULL,
Transaction_Date	DATE NOT NULL,
Transaction_Type	VARCHAR2(1 CHAR) NOT NULL,
Quantity	NUMBER(10) NOT NULL,
Actual_Cost NUMBER(10,4) NOT NULL
);

CREATE TABLE ptbl_Product(
Product_ID	NUMBER(10) NOT NULL, 
Product_Name	VARCHAR2(40) NOT NULL,
Standard_Cost	NUMBER(5) NOT NULL,
List_Price	NUMBER(7,2) NOT NULL,
Weight	NUMBER(7,2),
Product_Line	CHAR(2 CHAR ) ,
Product_Subcategory_ID NUMBER(5)
);

CREATE TABLE ptbl_Category(
Product_Category_ID	NUMBER(2,0) NOT NULL,
Category_Name VARCHAR2(20 CHAR) NOT NULL
);

CREATE TABLE ptbl_Subcategory(
Product_Subcategory_ID	NUMBER(3,0) NOT NULL,
Product_Category_ID	NUMBER(2,0) NOT NULL,
Subcategory_Name VARCHAR2(20 CHAR) NOT NULL
);