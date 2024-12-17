-- El siguiente ejemplo realizar la búsqueda utilizando el operador LIKE y un carácter que pudiera ser comodín. 
 
select * from Captura1 where (poliza LIKE '%!_%' ESCAPE '!') 
select * from Captura1 where (poliza LIKE '%PEL077%' + '%!_%' ESCAPE '!')  
