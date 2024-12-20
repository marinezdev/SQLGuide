Página de referencia. 
 
 
how to schedule and automate backups of sql server databases in sql server express 
https://support.microsoft.com/es-mx/help/2019698/how-to-schedule-and-automate-backups-of-sql-server-databases-in-sql-se 
 
Información: 
Se ejecuta archivo (ejemplo) para respaldar todas las base de datos. bck.bat 
Se ejecuta archivo (ejemplo) para respaldar la base de datos indicada. bck_wfip.bat 
 
 
 
Se crea la tabla _logSystem para almacenar el LOG. 
 
CREATE TABLE [dbo].[_logSystem]( 
[Id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL, 
[Tipo] [nvarchar](50) NOT NULL, 
[Fecha] [datetime] NOT NULL, 
[Numero] [nvarchar](max) NULL, 
[Severidad] [nvarchar](max) NULL, 
[Estado] [nvarchar](max) NULL, 
[Procedimiento] [nvarchar](max) NULL, 
[Linia] [nvarchar](max) NULL, 
[Mensaje] [nvarchar](max) NULL, 
) 
GO 
 
 
Se el store procedure sp_BackupDatabases en master. 
 
USE [master] 
GO 
/****** Object:  StoredProcedure [dbo].[sp_BackupDatabases]    Script Date: 10/09/2020 07:03:27 p. m. ******/ 
SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER ON 
GO 
  
  
-- =============================================  
-- Autor: Microsoft  
-- Fecha de creación: 2010-02-06 
-- Descripción: Copia de seguridad de bases de datos para SQLExpress 
-- Parameter1: databaseName  
-- Parameter2: backupType F=full, D=differential, L=log 
-- Parameter3: ubicación del archivo de copia de seguridad 
-- ============================================= 
  
 CREATE PROCEDURE [dbo].[sp_BackupDatabases]   
@databaseName sysname = null, 
@backupType CHAR(1), 
@backupLocation nvarchar(200)  
AS 
BEGIN 
BEGIN TRY 
SET NOCOUNT ON;  
  
DECLARE @DBs TABLE ( 
          ID int IDENTITY PRIMARY KEY, 
          DBNAME nvarchar(500) 
); 
  
-- Elija solo bases de datos que estén en línea en caso de que se haya optado por crear copias de seguridad de TODAS las bases de datos 
-- Si se optó por hacer una copia de seguridad de una base de datos específica, selecciónela en @DBs 
INSERT INTO @DBs (DBNAME) 
SELECT name FROM master.sys.databases 
WHERE state=0 
AND name=@DatabaseName OR @DatabaseName IS NULL 
ORDER BY name ASC; 
-- Filtra las bases de datos que no requieren copia de seguridad 
IF @backupType='F' 
DELETE @DBs where DBNAME IN ('tempdb','Northwind','pubs','master','model','msdb','AdventureWorks'); 
  
ELSE IF @backupType='D' 
DELETE @DBs where DBNAME IN ('tempdb','Northwind','pubs','master','model','msdb','AdventureWorks'); 
  
ELSE IF @backupType='L' 
DELETE @DBs where DBNAME IN ('tempdb','Northwind','pubs','master','model','msdb','AdventureWorks'); 
  
ELSE 
RETURN; 
  
-- Declare las variables 
DECLARE @BackupName varchar(100) 
DECLARE @BackupFile varchar(100) 
DECLARE @DBNAME varchar(300) 
DECLARE @sqlCommand NVARCHAR(1000)  
DECLARE @dateTime NVARCHAR(20) 
DECLARE @Loop int                   
  
-- Repetir una base de datos tras otra 
SELECT @Loop = min(ID) FROM @DBs 
WHILE @Loop IS NOT NULL 
BEGIN 
-- Los nombres de base de datos tienen que tener el formato [dbname], ya que algunos incluyen los caracteres - o _ 
SET @DBNAME = '['+(SELECT DBNAME FROM @DBs WHERE ID = @Loop)+']' 
-- Define la fecha y hora actuales en formato aaaahhmmss 
SET @dateTime = REPLACE(CONVERT(VARCHAR, GETDATE(),102),'.','') + '_' + REPLACE(CONVERT(VARCHAR, GETDATE(),108),':',''); 
  
-- Crea el nombre de archivo de copia de seguridad en formato ruta\nombredearchivo.extension para copias de seguridad completas, diferencial y de registro 
IF @backupType = 'F' 
SET @BackupFile = @backupLocation+REPLACE(REPLACE(@DBNAME, '[',''),']','')+'.BAK'; -- SET @BackupFile = @backupLocation+@dateTime+'_FULL_'+REPLACE(REPLACE(@DBNAME, '[',''),']','')+'.BAK' 
ELSE IF @backupType = 'D' 
SET @BackupFile = @backupLocation+@dateTime+'_DIFF_'+REPLACE(REPLACE(@DBNAME, '[',''),']','')+'.BAK'; 
ELSE IF @backupType = 'L' 
SET @BackupFile = @backupLocation+@dateTime+'_LOG_'+REPLACE(REPLACE(@DBNAME, '[',''),']','')+'.TRN' 
  
-- Coloca un nombre a la copia de seguridad para guardarla en los medios 
IF @backupType = 'F' 
SET @BackupName = REPLACE(REPLACE(@DBNAME,'[',''),']','')+'.BAK'; -- SET @BackupName = @dateTime+' full backup for '+REPLACE(REPLACE(@DBNAME,'[',''),']','') 
IF @backupType = 'D' 
SET @BackupName = @dateTime+' differential backup for '+REPLACE(REPLACE(@DBNAME,'[',''),']','') 
IF @backupType = 'L' 
SET @BackupName = @dateTime+' log backup for '+REPLACE(REPLACE(@DBNAME,'[',''),']','') 
  
-- Genera el comando SQL dinámico que se ejecutará 
IF @backupType = 'F'  
SET @sqlCommand = 'BACKUP DATABASE ' +@DBNAME+ ' TO DISK = '''+@BackupFile+ ''' WITH INIT, NAME= ''' +@BackupName+''', NOSKIP, NOFORMAT, CHECKSUM; ' -- SET @sqlCommand = 'BACKUP DATABASE ' +@DBNAME+ ' TO DISK = '''+@BackupFile+ ''' WITH INIT, NAME= ''' +@BackupName+''', NOSKIP, NOFORMAT' 
  
IF @backupType = 'D' 
SET @sqlCommand = 'BACKUP DATABASE ' +@DBNAME+ ' TO DISK = '''+@BackupFile+ ''' WITH DIFFERENTIAL, INIT, NAME= ''' +@BackupName+''', NOSKIP, NOFORMAT'         
  
IF @backupType = 'L'  
SET @sqlCommand = 'BACKUP LOG ' +@DBNAME+ ' TO DISK = '''+@BackupFile+ ''' WITH INIT, NAME= ''' +@BackupName+''', NOSKIP, NOFORMAT'         
  
                 -- Ejecuta el comando SQL generado 
EXEC(@sqlCommand) 
  
-- Ir a la siguiente base de datos 
SELECT @Loop = min(ID) FROM @DBs where ID>@Loop; 
END 
END TRY     
BEGIN CATCH 
DECLARE @_IdLog INT; 
INSERT INTO _logSystem 
SELECT 
'ERROR' AS 'Tipo'   
, GETDATE() AS 'Fecha' 
, ERROR_NUMBER() AS ErrorNumber   
, ERROR_SEVERITY() AS ErrorSeverity   
, ERROR_STATE() AS ErrorState   
, ERROR_PROCEDURE() AS ErrorProcedure   
, ERROR_LINE() AS ErrorLine   
, ERROR_MESSAGE() AS ErrorMessage;   
SET @_IdLog = @@IDENTITY; 
  
SELECT * 
FROM _logSystem 
WHERE _logSystem.Id = @_IdLog; 
RETURN; 
END CATCH 
END  
 
 
Ejecución de manera local sobre SQL. 
 
Se crea un respaldo general de todas las bases de datos 
EXEC sp_BackupDatabases null, 'F','C:\RMF\SQLBCK\' 
 
Se crea un respaldo de la base de datos indicada 
EXEC sp_BackupDatabases 'AsaeWFO','F','C:\RMF\SQLBCK\' 
 
-- Ejecución desde archivo BAT. 
Se puede ejecutar directamente el archivo BAT (en mis respaldos se encuentra el ejemplo del archivo)
O se puede crear una tarea programada dentro del servidor para hacer el respaldo desde el BAT y tambien se podria agregar para que el respaldo se envie a alguna unidad de red o algun medio externo.
