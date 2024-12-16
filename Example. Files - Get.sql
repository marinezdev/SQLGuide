-- The next script get all files from windows directory especifiqued 
 
declare @_rutaExpedientes nvarchar(500) ; 
declare @_FilesExpedientes table (archivo nvarchar(255), depht int, tipoArchivo int); 
  
set @_rutaExpedientes = 'path files wanted'; 
  
insert into @_FilesExpedientes 
exec master.sys.xp_dirtree @_rutaExpedientes,1,1;  
select * from @_FilesExpedientes 
