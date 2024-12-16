select @archivo = Archivos.Nombre from Archivos where Archivos.Id = (select Tramite_Det_IMSSPortal.IdArchivo from Tramite_Det_IMSSPortal where Poliza = @poliza and Quincena = @quincena) 
 
declare @Cmd nvarchar(1000); 
declare @SourceFile nvarchar(1000); 
declare @DestinationFile nvarchar(1000); 
 
set @SourceFile = 'F:\WEBSITES\WFO_IMSSPortal\PDF\' + @archivo; 
set @DestinationFile = 'C:\Users\rrodriguez\Desktop\cartas imss\' + @archivo; 
 
SET @Cmd = 'COPY "' + @SourceFile + '" "' + @DestinationFile + '"';  
EXEC master.dbo.xp_cmdshell @Cmd; 
 
select 'archivo copiado...';
