-- Procedimiento para la revisión de una base de datos. 

-- Checar el estado de la base de datos 
-- checks the physical and logical consistency of database pages, rows, allocation pages, index relationships, system table referential integrity, and other structure checks
DBCC CHECKDB 
  
--Efectuar correcciones 1 
ALTER DATABASE USM_AGUASCALIENTES SET SINGLE_USER 
GO 
DBCC CHECKDB('USM_AGUASCALIENTES', REPAIR_REBUILD) 
GO 
ALTER database USM_AGUASCALIENTES SET MULTI_USER 
GO 


--Efectuar correcciones 2 
ALTER DATABASE USM_AGUASCALIENTES SET SINGLE_USER 
GO 
DBCC CHECKDB('USM_AGUASCALIENTES', REPAIR_ALLOW_DATA_LOSS) 
GO 
ALTER database USM_AGUASCALIENTES SET MULTI_USER 
GO 
