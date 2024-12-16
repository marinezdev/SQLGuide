Store Procedure - Error LOG  (template)


    -- tabla para el manejo de Log   
    -- (crear si no existe y complementar en caso de que le hagan falta campos) 
    create table _logSystem( 
        Id int identity(1,1) primary key not null, 
        Tipo nvarchar(50) not null,                        -- Tiipo de LOG  // error, informacion, warning, update, insert, delete, etc... 
        Fecha datetime not null, 
        Numero nvarchar(max) null, 
        Severidad nvarchar(max) null, 
        Estado nvarchar(max) NULL, 
        Procedimiento nvarchar(max) null, 
        Linia nvarchar(max) null, 
        Mensaje nvarchar(max) null 
-- Agregar información del inicio de sesión  (sistema operativo, navegador, ips) 
    ) 
    go 
  
    -- <summary> 
    --        indicate the summary of the main functionality to which the module is focused 
    -- </summary> 
    -- <param name="@parameter1">define the parameter data</param> 
    -- <param name="@parameter2">define the parameter data</param> 
    -- <remarks> 
    --        indicate the important notes about functionality 
    -- </remarks> 
    -- <returns> 
    --        indicate result data type and description informaction to its implemantation 
    -- </returns> 
    create procedure NombreStoreProcedura 
        @parameter1 nvarchar(6), 
        @parameter2 nvarchar(6) 
    as 
    begin 
        -- =================================================================================================================== -- 
        --  Encabezado Store -- <inicio> 
        begin tran; 
        set nocount on; 
        declare @_errorNumber int; 
        set @_errorNumber = 0; 
  
        begin try 
            --  Contenido Store -- <inicio> 
            declare @a int; 
            declare @b int; 
            declare @c int; 
          
            set @a = 100; 
            set @b = 0; 
  
            if (@b = 0) 
                set @_errorNumber = 99001; -- custom error definition 
                -- Manejo de errores personalizado 
                -- RAISERROR ( 
                --                 N'This is message %s %d %d.', -- Message text. 
                --                 16, -- Severity (la serveridad tiene que ser 16 si deseamos que sea capturado por el try catch), 
                --                 1, -- State, 
                --                 N'number', -- First argument. 
                --                 5, -- second argument 
                --                 10 -- threeth argument   

            set @c = @a / @b; 
            --  Contenido Store -- <final> 
        end try 
        begin catch 
            -- aqui lo que se podría hacer es llamar a un store para almacenar el error... Indicando el usuario y la fecha en que se genera... Y si se puede toda la información del login (sistema operativo, ip, navegador, etc) 
            declare @_IdLog int; 
            set @_errorNumber = (select ERROR_NUMBER()); 
  
            insert into _logSystem 
            select  
                  'ERROR' AS 'Tipo'   
                , GETDATE() AS 'Fecha' 
                , ERROR_NUMBER() AS ErrorNumber   
                , ERROR_SEVERITY() AS ErrorSeverity   
                , ERROR_STATE() AS ErrorState   
                , ERROR_PROCEDURE() AS ErrorProcedure   
                , ERROR_LINE() AS ErrorLine   
                , ERROR_MESSAGE() AS ErrorMessage; 
             
            select * 
            from _logSystem 
            where _logSystem.Id = @_IdLog; 
        end catch 
  
        --  Finalización Store -- <inicio> 
        if (@_errorNumber = 0) 
            commit; 
        else 
            rollback; 
        -- =================================================================================================================== -- 
    end 