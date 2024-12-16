 CREATE TABLE ResultSet (Directory varchar(200)) 
 
 INSERT INTO ResultSet 
 EXEC master.dbo.xp_subdirs 'c:\' 
 
 Select * FROM ResultSet where Directory = 'testing';
