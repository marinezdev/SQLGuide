-- La configuración del envío de correo se encuentra documentada en las notas

EXEC msdb.dbo.sp_send_dbmail  
  @profile_name = 'SQL Adminisrtration' 
  ,@recipients = 'ruben.marines@asae.com.mx' 
  ,@copy_recipients = '' 
  ,@subject = 'test email sending from SQL Server' 
  ,@body = 'prueba del envío de correo electronicos desde SQL Server' 
  ,@body_format = 'HTML' 
  ,@from_address = 'Administración de Base de Datos <ruben.marines@asae.com.mx>' 


