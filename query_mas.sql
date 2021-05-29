--QUERY 
--Compte sans operation

SELECT C.id
FROM comptes C
LEFT JOIN operations O
ON O.compte_id=C.id 
WHERE O.compte_id IS NULL;


SELECT COUNT(*)
FROM comptes 
WHERE solde_comptes=0;
--AFTER CHANGE LEFT TO RIGHT

--Compte sans CREDIT

SELECT COUNT(*)
FROM comptes C
LEFT JOIN credits Cr
ON Cr.compte_id=C.id 
WHERE Cr.compte_id IS NULL;

--Membres dans compte
SELECT C.id 
FROM membres m
LEFT JOIN comptes C
ON m.id=C.membre_id 
WHERE C.membre_id IS NULL;