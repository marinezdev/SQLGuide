Example. Dividir Nombre

Obteniendo el nombre de una persona en una variable; el siguiente código realiza la separación del nombre en NOMBRE, APELLIDO PATERNO, APELLIDO MATERNO 
 
  
declare @nombreProspecto nvarchar(100); -- esta variable es la que se tomará de la insersión de datos... 
  
declare @_nombre table (id int identity(1,1), nombre nvarchar(100)) 
declare @_counNombre int; 
declare @_vAPaterno nvarchar(100); 
declare @_vAMaterno nvarchar(100); 
declare @_vNombre nvarchar(100); 
  
  
set @nombreProspecto = 'DANIELA CAMILA FATIMA Rubén Daniel  Marinez   Flores' 
 
-- Ie 
set @_counNombre = 0; 
set @_vAPaterno = ''; 
set @_vAMaterno = ''; 
set @_vNombre = ''; 
  
set @nombreProspecto = REPLACE(@nombreProspecto, '  ', ' '); 
set @nombreProspecto = REPLACE(@nombreProspecto, '  ', ' '); 
set @nombreProspecto = REPLACE(@nombreProspecto, '  ', ' '); 
set @nombreProspecto = REPLACE(@nombreProspecto, '  ', ' '); 
set @nombreProspecto = REPLACE(@nombreProspecto, '  ', ' '); 
  
insert into @_nombre 
select * from SplitString(@nombreProspecto,' '); 
  
set @_counNombre = (select count(*) from @_nombre); 
if (@_counNombre > 3) 
    begin 
        set @_vAMaterno = (select nombre from @_nombre where id = @_counNombre); 
        set @_vAPaterno = (select nombre from @_nombre where id = (@_counNombre - 1)); 
  
        declare @_contador int = 1; 
        set @_vNombre = ''; 
        while (@_contador <  (@_counNombre - 1)) BEGIN 
            if (@_contador > 1)  
                set @_vNombre = @_vNombre + ' '; 
                 
            set @_vNombre = @_vNombre + (select nombre from @_nombre where id = @_contador); 
            set @_contador += 1; 
        end 
  
    end 
else 
    begin 
        if (@_counNombre = 3) 
            begin 
                set @_vNombre = (select nombre from @_nombre where id = 1) ; 
                set @_vAPaterno = (select nombre from @_nombre where id = 2) ; 
                set @_vAMaterno = (select nombre from @_nombre where id = 3) ; 
            end 
        else 
            begin 
                if (@_counNombre = 2) 
                    begin 
                        set @_vNombre = (select nombre from @_nombre where id = 1) ; 
                        set @_vAPaterno = (select nombre from @_nombre where id = 2) ; 
                        set @_vAMaterno = '<< no asignado >>'; 
                    end 
                else 
                    begin 
                        set @_vNombre = @nombreProspecto; 
                        set @_vAPaterno = '<< no asignado >>'; 
                        set @_vAMaterno = '<< no asignado >>'; 
                    end 
            end 
    end 
  
  
 --select * from @_nombre; 
 --select @_vNombre + ' ' + @_vAPaterno + ' ' + @_vAPaterno; 
  
 PRINT 'NOMBRE: ' + @_vNombre; 
 PRINT 'NOMBRE: ' + @_vAPaterno; 
 PRINT 'NOMBRE: ' + @_vAPaterno; 