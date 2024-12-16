-- Referencia. 
-- https://database.guide/how-to-delete-files-in-sql-server-2019/ 
 
-- Se puede realizar el borrado de archivos ubicados en alguna carpeta de windows 
 
EXEC master.sys.xp_delete_files 
'C:\Program Files\Microsoft SQL Server\MSSQL15.ASAEDEV\MSSQL\Backup\r*.zip'; 
