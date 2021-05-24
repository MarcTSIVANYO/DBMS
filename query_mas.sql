--QUERY 
--Compte sans operation

SELECT C.id
FROM Comptes C
LEFT JOIN Operations O
ON O.compte_id=C.id 
WHERE O.compte_id IS NULL;

--AFTER CHANGE LEFT TO RIGHT

--CREDIT

SELECT C.id 
FROM Comptes C
LEFT JOIN Credits Cr
ON Cr.compte_id=C.id 
WHERE Cr.compte_id IS NULL;