-- Los siguientes script te muestran las transacciones abiertas. 
 
DBCC OPENTRAN 
SELECT * FROM SYS.SYSPROCESSES WHERE OPEN_TRAN = 1 
SELECT * FROM SYS.DM_TRAN_SESSION_TRANSACTIONS 
 
 
-- Referencia:  
-- https://danijordanga.wordpress.com/2015/09/09/como-identificar-transacciones-abiertas-en-sql-server/ 
