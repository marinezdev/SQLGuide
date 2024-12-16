Referencia:  
 
-- La siguiente información indica como crear un archivo zip comprimiendo, indicando el filtro de los archivos que se desean comprimir. 
-- En el servidor 172.16.2.81 se creo todo lo necesario para funcionar como ejemplo,  
-- https://en.dirceuresende.com/blog/sql-server-how-to-compress-and-unzip-files-and-directories-using-7-zip-and-xp_cmdshell-or-sqlclr-c/ 
 
-- Es necesario descargar 7zip dentro de una carpeta de Windows (C:\RMF\7zip\7za.exe) 

  
  -- Establecemos la configuración requerida (misma condiguracion del manejo de archivos). 
  sp_configure 'advanced options', 1 
  RECONFIGURE 
  GO 
    
  sp_configure 'xp_cmdshell', 1 
  RECONFIGURE 
  GO 
 
