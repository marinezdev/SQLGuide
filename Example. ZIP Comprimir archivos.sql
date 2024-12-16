-- Referencia:  
-- La siguiente información indica como crear un archivo zip comprimiendo, indicando el filtro de los archivos que se desean comprimir. 
-- En el servidor 172.16.2.81 se creo todo lo necesario para funcionar como ejemplo,  
-- https://en.dirceuresende.com/blog/sql-server-how-to-compress-and-unzip-files-and-directories-using-7-zip-and-xp_cmdshell-or-sqlclr-c/ 
 
-- Es necesario descargar 7zip dentro de una carpeta de Windows (C:\RMF\7zip\7za.exe) 
-- Establecemos la configuración requerida. 
 
sp_configure 'advanced options', 1 
RECONFIGURE 
GO 
  
sp_configure 'xp_cmdshell', 1 
RECONFIGURE 
GO 
 
-- Creamos SP. Se debe configurar e indicar donde se encuentra el ejecutable 7zip 
 CREATE PROCEDURE dbo.sp_ArchivoCompacta ( 
    @caminho VARCHAR(500), 
    @filtro VARCHAR(500), 
    @arquivoCompactado VARCHAR(500), 
    @nivelCompactacao INT = 5, 
    @recursivo BIT = 0, 
    @senha VARCHAR(100) = NULL 
) 
AS  
BEGIN 
DECLARE @caminhoBinario VARCHAR(255) = 'C:\RMF\7zip\7za.exe' 
    DECLARE @argumentos VARCHAR(MAX) = 'a -tzip -mx' + CAST(@nivelCompactacao AS VARCHAR(2)) + ' "' + @arquivoCompactado + '"' + (CASE WHEN @recursivo = 1 THEN ' -r' ELSE '' END) + (CASE WHEN NULLIF(LTRIM(RTRIM(@senha)), '') IS NOT NULL THEN ' -p' + @senha ELSE '' END) + ' "' + @caminho + '\' + @filtro + '" -mmt'; 
    DECLARE @Comando VARCHAR(8000) = 'call "' + @caminhoBinario + '" ' + @argumentos 
    EXEC xp_cmdshell @Comando 
END 
  
-- Comprimimos los archivos en ZIP 
 
EXEC master.dbo.sp_ArchivoCompacta 
    @caminho = 'C:\Program Files\Microsoft SQL Server\MSSQL15.ASAEDEV\MSSQL\Backup\', -- varchar(500) 
    @filtro = '*.bak', -- varchar(500) 
    @arquivoCompactado = 'C:\Program Files\Microsoft SQL Server\MSSQL15.ASAEDEV\MSSQL\Backup\respaldo_n5.zip', -- varchar(500) 
    @nivelCompactacao = 5, -- int 
    @recursivo = 1 -- bit 
