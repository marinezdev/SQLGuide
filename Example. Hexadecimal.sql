Example. Hexadecimal 

Information about how to management hexa values on data 
 
Reference: 
https://www.databasejournal.com/ms-sql/displaying-and-removing-unprintable-hexadecimal-characters-from-sql-server-data/ 
 
 
  
-- insert a TAB character into the middle of my string variable 
DECLARE @String varchar(30) = 'This is' + cast(0x1A as varchar(1)) + 'my string'; 
SELECT @String as MyString                                                                -- visualiza caracter no imprimible 
SELECT @String as MyString, CAST(@String as varbinary(max)) MyString_In_Hexidecimal;    -- convierte toda la cadena en hexadecimal 
  
  
SET @String = REPLACE(@String,0x1A,' '); 
SELECT @String as MyString, CAST(@String as varbinary(max)) MyString_In_Hexidecimal; 
  
--update bitacora_P1 set Observacion = REPLACE(Observacion,0x1A,' '), ObservacionPrivada = REPLACE(ObservacionPrivada,0x1A,' '); 
--update bitacora_P2 set Observacion = REPLACE(Observacion,0x1A,' '), ObservacionPrivada = REPLACE(ObservacionPrivada,0x1A,' '); 
--update bitacora_P3 set Observacion = REPLACE(Observacion,0x1A,' '), ObservacionPrivada = REPLACE(ObservacionPrivada,0x1A,' '); 
--update bitacora_P4 set Observacion = REPLACE(Observacion,0x1A,' '), ObservacionPrivada = REPLACE(ObservacionPrivada,0x1A,' '); 