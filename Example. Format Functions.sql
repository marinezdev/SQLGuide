-- Examples about all use of format function 
 
-- formating DATETIME 
FORMAT((select max(tramitemesa.fechaFin) from tramitemesa where tramitemesa.IdTramite = tramite.id), 'dd/MM/yyyy HH:mm:ss') as 'Fecha Último Status' 
 
