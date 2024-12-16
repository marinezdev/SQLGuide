Example. Variable as Table

Se crea una variable de tipo tabla y se puede utilizar como una tabla de base de datos 
 
DECLARE @product_table TABLE ( 
    product_name VARCHAR(MAX) NOT NULL, 
    brand_id INT NOT NULL, 
    list_price DEC(11,2) NOT NULL 
); 
  
insert into @product_table (product_name, brand_id, list_price) values ('analgesico', 1001, 10.50); 
Select * from @product_table 