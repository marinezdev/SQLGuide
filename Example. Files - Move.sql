-- El sisguien script realiza la copia de archivos de un directorio a otro especificando cantidad máxima de archivos a mover 
 
 
use master 
go  
  
set nocount on;  
begin try  
       declare @_resultadoMove table (id int identity(1,1), resultado nvarchar(1000), archivo nvarchar(255));  
       declare @_filesOrigin table (archivo nvarchar(255), depht int, tipoArchivo int);  
       declare @_pathFilesOrigin nvarchar(500);  
       declare @_pathFilesDest nvarchar(500);  
       declare @_filesBackUp table (archivo nvarchar(255), proceso nvarchar(100), destino nvarchar(255), accion nvarchar(100) );  
       declare @SourceFile nvarchar(1000);  
       declare @DestinationFile nvarchar(1000);   
    declare @_resultadoId int;  
       declare @Cmd nvarchar(1000);  
    declare @_contador int;  
    declare @_archivoMove int;  
    declare @_archivoName nvarchar(255);  
    declare @_errorNumber int;  
    declare @_filesMoved int;  
   
       -- Inicializacion de variable  
       set @_filesMoved = 0;  
       set @_errorNumber = 0;  
       set @_contador = 0;  
       set @_archivoName = '';  
       set @_archivoMove = xxxx;                     --- (MAX = 1000) indica la catnidad de archivos que se desean mover [hay que verificar el top del cursor...]  
   
       -- Establecemos las rutas de los expediente del proyecto PAM  
       set @_pathFilesOrigin = H:\WEBSITES_old\WFO_Privado\DocsUp;  
       set @_pathFilesDest = H:\WEBSITES_old\WFO_Privado\DocsUp\carpeta_destino;  
  
       -- insertamos los archivos existentes en la origen 
       insert into @_filesOrigin 
       exec master.sys.xp_dirtree @_pathFilesOrigin,1,1;   
  
       declare curFilesTemporaly cursor for  
       select top 1000 archivo from @_filesOrigin  
       open curFilesTemporaly  
       fetch next from curFilesTemporaly into @_archivoName  
    while @@FETCH_STATUS = 0  
    begin   
        -- informaciòn para debug  
              set @_contador = @_contador + 1;  
              print convert(nvarchar, @_contador) + ' ' + @_archivoName;  
  
              -- Indicamos que el archivo se moverà para poder realizar los respaldos correctamente 
              print convert(nvarchar, @_contador) + ' ' + @_archivoName + '   El archivo existe para respaldo';  
              insert into @_filesBackUp (archivo, proceso, destino, accion) values (@_archivoName, 'Privado Old', @_pathFilesOrigin, 'Archivo MOVE - Expediente enviado a respaldo');  
  
        -- establecemos las rutas para mover los archivos  
        set @SourceFile = @_pathFilesOrigin + '\' + @_archivoName;  
        set @DestinationFile = @_pathFilesDest + '\' + @_archivoName;  
        print 'MOVE "' + @SourceFile + '" "' + @DestinationFile + '"';   
  
                -- Movemos el archivo al respaldo  
                set @Cmd = 'MOVE "' + @SourceFile + '" "' + @DestinationFile + '"';   
                insert into @_resultadoMove (resultado)   
                exec master.dbo.xp_cmdshell @Cmd;  
  
                delete from @_resultadoMove where resultado is null;  
                update @_resultadoMove set archivo = @_archivoName where id = @_resultadoId;  
                set @_filesMoved = @_filesMoved + 1;  
  
                if (@_filesMoved >= @_archivoMove)  
                begin  
                            select 'Se procesaron ' + CONVERT(nvarchar,@_filesMoved) + ' archivos que se enviaron al respaldo...'  
                            GOTO Branch_End  
                end  
                fetch next from curFilesTemporaly into @_archivoName  
    end  
  
Branch_End:  
    close curFilesTemporaly  
    deallocate curFilesTemporaly  
  
    -- Indicamos los archivos que se enviaron al respaldo  
    select 'archivo respaldado', * from @_resultadoMove;  
end try  
begin catch  
--          -- aqui lo que se podría hacer es llamar a un store para almacenar el error... Indicando el usuario y la fecha en que se genera... Y si se puede toda la información del login (sistema operativo, ip, navegador, etc)  
--          declare @_IdLog int;  
            set @_errorNumber = (select ERROR_NUMBER());  
--  
--          insert into _logSystem  
            select   
                          'ERROR' AS 'Tipo'    
                        , GETDATE() AS 'Fecha'  
                        , ERROR_NUMBER() AS ErrorNumber    
                        , ERROR_SEVERITY() AS ErrorSeverity    
                        , ERROR_STATE() AS ErrorState    
                        , ERROR_PROCEDURE() AS ErrorProcedure    
                        , ERROR_LINE() AS ErrorLine    
                        , ERROR_MESSAGE() AS ErrorMessage;  
--          select *  
--          from _logSystem  
--          where _logSystem.Id = @_IdLog;  
end catch  
  
--  Finalización Store -- <inicio>  
if (@_errorNumber = 0)  
       select 'SE TERMINO EL PROCESO DE MANERA CORRECTA... ' + CONVERT(nvarchar,@_filesMoved) + ']' as resultado;  
else  
    select 'EL PROCESO PRESENTO INCIDENCIA' as resultado; 
