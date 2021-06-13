--1. Create a sequences which begins with 101, and goes up in 4.

CREATE SEQUENCE newSeqEexercie
START WITH 101
INCREMENT BY 4
MINVALUE 101
MAXVALUE 999999
CYCLE
CACHE 50
;

SELECT O.NAME, S.*
FROM sys.seq$ S
LEFT JOIN OBJ$ O
ON S.OBJ# = O.OBJ#
ORDER BY O.NAME;

--2. Add an extra column to ptbl_Product, and assign this sequence as the default value.

ALTER TABLE ptbl_Product
ADD number_seq NUMBER(6,0);

ALTER TABLE ptbl_Product
MODIFY number_seq NUMBER(6,0) DEFAULT newSeqEexercie.NEXTVAL;

SELECT * FROM ptbl_Product;

SELECT newSeqEexercie.NEXTVAL FROM DUAL;

--3. There are no values in this new column. UPDATE this column with values from the new sequence.
DROP SEQUENCE newSeqEexercie;

UPDATE ptbl_Product
SET number_seq = newSeqEexercie.NEXTVAL
WHERE number_seq IS NULL;

SELECT * FROM ptbl_Product;

ROLLBACK;
