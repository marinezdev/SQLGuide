-- En la siguiente página se indica como utilizar el SLEEP en SQL Server. 
-- Tema interesante para temas de mantenimiento. 
-- https://docs.microsoft.com/en-us/sql/t-sql/language-elements/waitfor-transact-sql?view=sql-server-ver15 
 
BEGIN   
  SELECT GETDATE(); 
  WAITFOR DELAY '00:00:00.500';     -- se espera 500 milisegundos 
  SELECT GETDATE();     
END;   
GO
