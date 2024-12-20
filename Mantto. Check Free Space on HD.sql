-- The next script chec the space free avaliable on hard disk of server. 
declare @_spacefree table (drive nvarchar(3), mb float, gb float) 
  
-- View Disk Available Space 
insert into @_spacefree(drive, mb) 
EXEC master.dbo.xp_fixeddrives 
  
update @_spacefree set gb = mb / 1024;
select * from @_spacefree 
 
 
-- Referencia: 
-- SQL Server -- Get Disk Space Usage (programmer.group) 
-- https://programmer.group/sql-server-get-disk-space-usage.html#:~:text=The%20most%20commonly%20used%20way%20to%20view%20disk,and%20the%20unused%20disk%20information%20of%20SQL%20Server
