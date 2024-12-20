-- El siguiente QUERY indica el número de conexiones abiertas  en la base de datos 
 
SELECT @@ServerName AS SERVER 
, NAME AS DBNAME 
, LOGINAME AS LOGINAME 
, COUNT(STATUS) AS NUMBRE_OF_CONNECTIONS 
, GETDATE() AS TIMESTAMP 
FROM SYS.DATABASES SD 
LEFT JOIN SYS.SYSPROCESSES SP ON SD.DATABASE_ID = SP.DBID 
WHERE DATABASE_ID NOT BETWEEN 1 AND 4 
AND LOGINAME IS NOT NULL 
GROUP BY NAME, LOGINAME; 