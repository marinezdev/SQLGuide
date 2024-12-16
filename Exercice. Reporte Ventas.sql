SET LANGUAGE Spanish 
  
CREATE TABLE #Reporte (AÑO INT, MES NVARCHAR(100), INGRESADOS INT, EMITIDOS INT, RECHAZADOS INT, CANCELADOS INT, CADUCADOS INT, TOTAL INT, FECHAINICIAL DATETIME, FECHAFINAL DATETIME); 
DECLARE @FechaInicio DATETIME; 
DECLARE @FechaFinal DATETIME; 
  
SET @FechaInicio = '2018/01/01'; 
-- SELECT EOMONTH(@FechaInicial); 
  
DECLARE @Contador SMALLINT; 
SET @Contador = 0; 
  
WHILE @Contador < 12 
BEGIN 
SET @FechaFinal = EOMONTH(@FechaInicio); 
SET @FechaFinal = DATEADD(SECOND,59,DATEADD(MINUTE,59,DATEADD(HOUR, 23, @FechaFinal))) 
  
PRINT CONVERT(VARCHAR,@FechaInicio); 
PRINT CONVERT(VARCHAR,@FechaFinal); 
PRINT CONVERT(VARCHAR,YEAR(@FechaFinal)); 
PRINT CONVERT(VARCHAR,DATENAME(MONTH, @FechaFinal)); 
  
  
INSERT INTO #Reporte 
SELECT 
YEAR(@FechaFinal) AS AÑO, 
CONVERT(VARCHAR,DATENAME(MONTH, @FechaFinal)) AS MES,  
(SELECT COUNT(*) FROM tramite WHERE (FechaRegistro BETWEEN @FECHAINICIO AND @FECHAFINAL)) AS INGRESADOS, 
(SELECT COUNT(*) FROM tramite WHERE Estado IN (SELECT statusTramite.Id FROM statusTramite WHERE (FechaTermino BETWEEN @FECHAINICIO AND @FECHAFINAL) AND statusTramite.Nombre IN ('Ejecucion'))) AS EMITIDOS, 
(SELECT COUNT(*) FROM tramite WHERE Estado IN (SELECT statusTramite.Id FROM statusTramite WHERE (FechaTermino BETWEEN @FECHAINICIO AND @FECHAFINAL) AND statusTramite.Nombre IN ('Rechazo'))) AS RECHAZADOS, 
(SELECT COUNT(*) FROM tramite WHERE Estado IN (SELECT statusTramite.Id FROM statusTramite WHERE (FechaTermino BETWEEN @FECHAINICIO AND @FECHAFINAL) AND statusTramite.Nombre IN ('Cancelado', 'Promotoría Cancela'))) AS CANCELADOS, 
(SELECT COUNT(*) FROM tramite WHERE Estado IN (SELECT statusTramite.Id FROM statusTramite WHERE (FechaTermino BETWEEN @FECHAINICIO AND @FECHAFINAL) AND statusTramite.Nombre IN ('Caducado'))) AS CADUCADOS, 
( 
(SELECT COUNT(*) FROM tramite WHERE Estado IN (SELECT statusTramite.Id FROM statusTramite WHERE (FechaTermino BETWEEN @FECHAINICIO AND @FECHAFINAL) AND statusTramite.Nombre IN ('Ejecucion'))) + 
(SELECT COUNT(*) FROM tramite WHERE Estado IN (SELECT statusTramite.Id FROM statusTramite WHERE (FechaTermino BETWEEN @FECHAINICIO AND @FECHAFINAL) AND statusTramite.Nombre IN ('Rechazo'))) + 
(SELECT COUNT(*) FROM tramite WHERE Estado IN (SELECT statusTramite.Id FROM statusTramite WHERE (FechaTermino BETWEEN @FECHAINICIO AND @FECHAFINAL) AND statusTramite.Nombre IN ('Cancelado', 'Promotoría Cancela'))) + 
(SELECT COUNT(*) FROM tramite WHERE Estado IN (SELECT statusTramite.Id FROM statusTramite WHERE (FechaTermino BETWEEN @FECHAINICIO AND @FECHAFINAL) AND statusTramite.Nombre IN ('Caducado')))  
) AS TOTALES, 
@FechaInicio AS FECHA_INICIAL, 
@FechaFinal AS FECHA_FINAL; 
  
SET @Contador = @Contador + 1; 
SET @FechaInicio = DATEADD(MONTH, 1, @FechaInicio); 
END 
  
SELECT * FROM #Reporte; 
DROP TABLE #Reporte; 
  
