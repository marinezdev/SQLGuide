SELECT COUNT(servicename) 
FROM sys.dm_server_services 
WHERE servicename IN ('SQL Server (MSSQLSERVER)','SQL Server Agent (MSSQLSERVER)') 
  AND status_desc = 'Running' 
