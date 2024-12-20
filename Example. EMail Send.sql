-- INFORMATION: Referencia para la configuración de Envio de Mails. 
-- INFORMATION: https://database.guide/how-to-send-emails-from-sql-server-t-sql/ 
-- INFORMATION: https://www.sqlshack.com/es/como-poder-configurar-la-base-de-datos-del-correo-en-sql-server/ 
 
  -- NOTA Importante: para utilizar el siguiente código se tuvo que haber creado el perfil y la cuenta de mail en SQL Server. Se explica en el link anterior. 
USE msdb 
GO 
 
declare @contenido nvarchar(MAX); 
declare @fechaEnvio nvarchar(30); 
 
set @fechaEnvio = CONVERT(nvarchar, GETDATE(), 103) + ' ' + CONVERT(nvarchar, GETDATE(), 108); 
print @fechaEnvio; 
 
set @contenido = '<h1>WARNING</h1><hr/><br/><small>Enviamos mensaje de prueba....<br/><br/>' + @fechaEnvio + '</small>'; 
--print @contenido; 
 
EXEC msdb.dbo.sp_send_dbmail  
  @profile_name='SQL Administrador' 
  ,@recipients='ruben.marines@asae.com.mx' 
  ,@copy_recipients = '' 
  ,@subject='Warning [x9999]' 
  ,@body=@contenido 
  ,@body_format = 'HTML' 
  ,@from_address = 'Administración de Base de Datos <ruben.marines@asae.com.mx>' 
  ,@file_attachments = 'F:\WEBSITES\certificate.rmf' 
  ,@importance = 'High' 
