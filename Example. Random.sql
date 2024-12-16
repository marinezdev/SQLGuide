Example. Random()

Setencia SQL para obtener un número aleatorio 
 
 
-- Para números enteros (entre 1 y 20) 
SELECT ROUND(((20 - 1) * RAND() + 1), 0) 
  
-- Para números decimales 
SELECT ROUND(((20 - 1) * RAND() + 1), 4) 
 
Desde <https://desarrolladores.me/2014/04/sql-server-generar-numeros-aleatoriamente/>  
 
 