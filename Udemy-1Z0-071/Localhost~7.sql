SELECT LOCALTIMESTAMP FROM DUAL; -- Current Date/Time as Timestamp
SELECT SESSIONTIMEZONE FROM DUAL; -- Current Session Time zone
SELECT TZ_OFFSET('Europe/Paris') FROM DUAL; -- What is the Time zone Offset?
SELECT CURRENT_TIMESTAMP FROM DUAL; -- Current Session Date/Time as Time zone
SELECT SYSTIMESTAMP FROM DUAL; -- Current Database Date/Time as Time zone
SELECT FROM_TZ(TIMESTAMP '2022-02-28 21:44:00', '+03:00') FROM DUAL; -- Adding a Time zone.
SELECT CAST(NEW_TIME(TO_DATE('2022-02-28 21:44:00', 'YYYY-MM-DD HH24:MI:SS'), 'EST', 'GMT') AS TIMESTAMP(6)) FROM DUAL;

    -- Converting between Time zones, and converting time.
SELECT CAST(NEW_TIME(TO_DATE('2022-04-28 21:44:00', 'YYYY-MM-DD HH24:MI:SS'), 'EDT', 'BST') AS TIMESTAMP(6)) FROM DUAL;
                                    -- Converting between Time zones, and converting time.
SELECT SYS_EXTRACT_UTC(TIMESTAMP '2022-02-28 21:44:00 -08:00') FROM DUAL;   -- Converting to GMT/UTC

--Converting strings to Time zone
SELECT TO_DATE('2022-02-28 21:44:00', 'YYYY-MM-DD HH24:MI:SS') FROM DUAL; --Converting to standard Date
SELECT TO_TIMESTAMP('2022-02-28 21:44:00', 'YYYY-MM-DD HH24:MI:SS') FROM DUAL; --Converting to standard Timestamp
SELECT TO_TIMESTAMP_TZ('2022-02-28 21:44:00 -08:00', 'YYYY-MM-DD HH24:MI:SS TZH:TZM') FROM DUAL; --Converting to Time zone



SELECT * FROM CAT;
SELECT * FROM TAB$;
SELECT * FROM OBJ$;
SELECT O.Name, T.* 
FROM TAB$ T 
LEFT JOIN OBJ$ O ON T.OBJ# = O.OBJ#
ORDER BY O.Name;


