
-- El siguiente ejemplo es el manejo de cursor. 
-- Aqui se tiene el debate de que es mejora para el rendimiento, si el CURSOR o recorrer una tabla temporal con WHILE

DECLARE @_contador INT; 
DECLARE @Nombre NVARCHAR(MAX); 
DECLARE @Clave NVARCHAR(MAX); 
  
SET @_contador = 0; 
  
DECLARE curExample CURSOR FOR 
SELECT Nombre, Clave FROM Usuarios 
OPEN curExample   
FETCH NEXT FROM curExample INTO @Nombre, @Clave 
  
WHILE @@FETCH_STATUS = 0 
BEGIN  
  PRINT CONCAT(@Nombre,' / ',@Clave) 
  SET @_contador = @_contador + 1; 
  FETCH NEXT FROM curExample INTO @Nombre, @Clave 
END 
CLOSE curExample 
DEALLOCATE curExample 
  
PRINT 'Registros Procesados: ' + CONVERT(VARCHAR,@_contador); 
