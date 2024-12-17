-- anterior a esto hay que hacer un truncate table o un delete 
-- Reiniciamos el ID de la tabla 
DBCC CHECKIDENT(cliente, NORESEED) 
DBCC CHECKIDENT(cliente, RESEED,1) 
DBCC CHECKIDENT(cliente, NORESEED) 
