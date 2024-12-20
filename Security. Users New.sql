El siguiente script crea un usuario y le otorga o quita permisos dentro de una base de datos especifica. 
 
 
 
 
 
-- ejemplos: https://www.sqlshack.com/es/como-bajar-o-eliminar-el-inicio-de-sesion-de-sql-server-y-todas-sus-dependencias/ 
--           http://www.udb.edu.sv/udb_files/recursos_guias/informatica-ingenieria/base-de-datos-i/2019/i/guia-12.pdf 
-- presentación seguridad-sql-2008.ppt 
 
--------  **>>>>> ES RECOMENDABLE DESHABILITAR EL USUARIO SA 
 
----  Creates the login appWFOPrivado with password 'P@ssword.'   
-- CREATE LOGIN appWFOPrivado WITH PASSWORD = 'P@ssword.'; --- // DROP LOGIN appWFOPrivado ; 
-- GO   
 
Una vez que se haya creado el LOGIN ASAEAdmin .. debemos entrar como sa y otorgarle los permisos de SYSADMIN 
 
 
----  Create the user to WFO Privado Database (permisos sobre la base de datos que se va a poder visualizar).  
 --USE wfip;   
 --GO   
 --CREATE USER appWFOPrivadoUser FOR LOGIN appWFOPrivado; --- // DROP USER appWFOPrivadoUser ; 
 --GO     
 
--- >> Probamos que el usuario se pueda conectar & accesar a la base de datos... (no tendrá permisos sobre ningún objeto de la base de datos) 
 
 
----  Asignar permisos dbo 
-- USE wfip; 
-- EXEC sp_addrolemember 'db_datareader', 'appWFOPrivadoUser' -- permisos de solo lectura a las tablas / vistas 
-- EXEC sp_addrolemember 'db_owner', 'appWFOPrivadoUser' -- permisos completo sobre la base de datos... 
 
-- GO 
 
 
 
----  Verificamos los permisos otorgados 
-- select *  
-- From sys.database_permissions  
-- where grantee_principal_id = USER_ID('appWFOPrivadoUser') 
 
-- saber usuario conectado 
select ORIGINAL_LOGIN() 
 
 
----  Quitamos permisos especificos 
-- DENY CREATE TABLE TO appWFOPrivadoUser -- no puedo crear tablas 
-- DENY SELECT TO appWFOPrivadoUser -- no puede seleccionar 
-- REVOKE DELETE  TO appWFOPrivadoUser -- no puede borrar 
 
 
 
