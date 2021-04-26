DROP TABLE MYTABLE;

CREATE TABLE MYTABLE
(myDate DATE);

ALTER TABLE MYTABLE
ADD  MYDATETIME TIMESTAMP;

ALTER TABLE MYTABLE
MODIFY  MYDATETIME TIMESTAMP(0);

INSERT INTO MYTABLE
VALUES( '11/02/2021', '12-Avril-2021 09:19:10');
COMMIT;

SELECT *
FROM MYTABLE;

SELECT mydate original_date, TRUNC(mydate)-(EXTRACT(DAY FROM mydate))+1 as firstDay, NEXT_DAY(mydate, 'LUNDI') nextDay, EXTRACT(DAY FROM mydate) extract,  LAST_DAY(mydate) lastDay, mydatetime ori_datetime,TRUNC(mydatetime) TRUNC, ROUND(mydatetime) ROUND, mydate +1 as Add1Day, ADD_MONTHS(mydate,12) as addMounth, ADD_MONTHS(mydate,-1) as PriveMouths
FROM MYTABLE;

SELECT CURRENT_DATE, SYSDATE 
FROM DUAL;

SELECT 'The date is ' || TO_CHAR(mydatetime,'DL') as Result
FROM MYTABLE;

SELECT 'The time is ' || TO_CHAR(mydatetime,'HH24:MI:SS a.m.' ) || '.' as Result
FROM MYTABLE;

SELECT 'Date is ' || TO_CHAR(mydatetime,'DL TS' ) || '.' as Result
FROM MYTABLE;

SELECT TO_DATE('January 16, 2021 11:50 AM', 'Month DD, YYYY HH:MI AM',
                'NLS_DATE_LANGUAGE=English') as Result
FROM DUAL;