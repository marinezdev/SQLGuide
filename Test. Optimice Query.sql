---- ======================================================================================================================================
---- ### Creación de tablas 

---- Tabla de clientes
--CREATE TABLE clientes (
--    cliente_id INT IDENTITY(1,1) PRIMARY KEY,					-- cliente_id SERIAL PRIMARY KEY,		(PostgreSQL)
--    nombre VARCHAR(100),
--    email VARCHAR(100),
--    ciudad VARCHAR(100)
--);

---- Tabla de ventas
--CREATE TABLE ventas (
--    venta_id INT IDENTITY(1,1) PRIMARY KEY,
--    cliente_id INT REFERENCES clientes(cliente_id),
--    fecha_venta DATE,
--    total DECIMAL(10, 2)
--);

---- Tabla de ordenes
--CREATE TABLE ordenes (
--    orden_id INT IDENTITY(1,1) PRIMARY KEY,
--    venta_id INT REFERENCES ventas(venta_id),
--    fecha_orden DATE
--);

---- Tabla de detalle de ordenes
--CREATE TABLE detalle_ordenes (
--    detalle_id INT IDENTITY(1,1) PRIMARY KEY,
--    orden_id INT REFERENCES ordenes(orden_id),
--    producto VARCHAR(100),
--    cantidad INT,
--    precio_unitario DECIMAL(10, 2)
--);

--CREATE TABLE Numeros (
--    Numero INT PRIMARY KEY
--);


---- ======================================================================================================================================
---- ### Insersion de datos de prueba

---- Insertar números del 1 al 10,000,000 (esto puede tardar un poco)
--INSERT INTO Numeros (Numero)
--SELECT n
--FROM (
--    SELECT ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
--    FROM sys.all_columns AS a1
--    CROSS JOIN sys.all_columns AS a2  -- Esto genera muchas combinaciones
--) AS SubQuery
--WHERE n <= 10000000;
----SELECT FORMAT(count(*), '#,##0') FROM numeros;

---- Insertar 10000000 clientes
--INSERT INTO clientes (nombre, email, ciudad)
--SELECT
--    'Cliente ' + CAST(i AS VARCHAR(10)),
--    'cliente' + CAST(i AS VARCHAR(10)) + '@correo.com',
--    CASE WHEN i % 3 = 0 THEN 'Ciudad A'
--         WHEN i % 3 = 1 THEN 'Ciudad B'
--         ELSE 'Ciudad C' END
--FROM (
--    SELECT TOP 10000000
--        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS i
--    FROM Numeros
--) AS numeros;
----SELECT FORMAT(count(*), '#,##0') FROM clientes;
----SELECT * FROM clientes;


---- Insertar 10000000 ventas
--INSERT INTO ventas (cliente_id, fecha_venta, total)
--SELECT
--    ABS(CHECKSUM(NEWID())) % 10000000 + 1, -- Cliente aleatorio diferente para cada fila
--    DATEADD(day, -ABS(CHECKSUM(NEWID())) % 365, GETDATE()), -- Fecha aleatoria en el último año
--    ROUND(CAST(ABS(CHECKSUM(NEWID())) % 500 + 50 AS NUMERIC(10, 2)), 2) -- Total aleatorio entre 50 y 550
--FROM (
--    SELECT TOP 10000000
--        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS i
--    FROM sys.all_columns AS a1
--    CROSS JOIN sys.all_columns AS a2
--) AS numeros;
----SELECT FORMAT(count(*), '#,##0') FROM ventas;
----SELECT * FROM ventas;
----SELECT cliente_id, count(*) FROM ventas GROUP BY cliente_id ORDER BY count(*) DESC; 

---- Insertar 10000000 ordenes
--INSERT INTO ordenes (venta_id, fecha_orden)
--SELECT
--    ABS(CHECKSUM(NEWID())) % 10000000 + 1, -- Venta aleatoria diferente para cada fila
--    DATEADD(day, -ABS(CHECKSUM(NEWID())) % 365, GETDATE()) -- Fecha de orden aleatoria en el último mes
--FROM (
--    SELECT TOP 10000000
--        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS i
--    FROM sys.all_columns AS a1
--    CROSS JOIN sys.all_columns AS a2
--) AS numeros;
----SELECT FORMAT(count(*), '#,##0') FROM ordenes;
----SELECT * FROM ordenes;



---- Insertar 10000000 detalles de ordenes
--INSERT INTO detalle_ordenes (orden_id, producto, cantidad, precio_unitario)
--SELECT
--    ABS(CHECKSUM(NEWID())) % 10000000 + 1, -- Orden aleatoria diferente para cada fila
--    CASE WHEN i % 3 = 0 THEN 'Producto A'
--         WHEN i % 3 = 1 THEN 'Producto B'
--         ELSE 'Producto C' END,
--    CAST(ABS(CHECKSUM(NEWID())) % 10 + 1 AS INT), -- Cantidad aleatoria entre 1 y 10
--    ROUND(ABS(CHECKSUM(NEWID())) % 100 + 5, 2) -- Precio unitario aleatorio entre 5 y 105
--FROM (
--    SELECT TOP 10000000
--        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS i
--    FROM sys.all_columns AS a1
--    CROSS JOIN sys.all_columns AS a2
--) AS numeros;
----SELECT FORMAT(count(*), '#,##0') FROM detalle_ordenes;
----SELECT * FROM detalle_ordenes;


---- ======================================================================================================================================
---- ### Ejemplos de consulta

-- Consulta 01 -- Obtención de la información de Ventas
SELECT c.cliente_id, c.nombre, dor.producto, dor.cantidad, dor.cantidad * dor.precio_unitario AS precio_total
FROM clientes c
INNER JOIN ventas v ON c.cliente_id = v.cliente_id
INNER JOIN ordenes o ON v.venta_id = o.venta_id
INNER JOIN detalle_ordenes dor ON o.orden_id = dor.orden_id
WHERE
    v.fecha_venta >= DATEADD(day, -30, GETDATE())
    AND EXISTS (
        SELECT 1
        FROM ventas v2
        WHERE v2.cliente_id = c.cliente_id
        GROUP BY v2.cliente_id
        HAVING SUM(v2.total) > 500
    );

---- Optimización 
---- CREATE INDEX idx_ventas_fecha_cliente ON ventas (fecha_venta, cliente_id);
---- CREATE NONCLUSTERED INDEX idx_ventas_cliente ON [dbo].[ventas] ([cliente_id]) INCLUDE ([total])
---- CREATE NONCLUSTERED INDEX idx_ordenes_venta ON [dbo].[ordenes] ([venta_id])
---- CREATE NONCLUSTERED INDEX idx_detalleOrdenes_details ON [dbo].[detalle_ordenes] ([orden_id]) INCLUDE ([producto],[cantidad],[precio_unitario])

-- Consulta optimizada
WITH TotalCompras AS (
    SELECT cliente_id, SUM(total) AS total_compras
    FROM ventas
    GROUP BY cliente_id
)
SELECT c.cliente_id, c.nombre, dor.producto, dor.cantidad, dor.cantidad * dor.precio_unitario AS precio_total
FROM clientes c
INNER JOIN ventas v ON c.cliente_id = v.cliente_id
INNER JOIN ordenes o ON v.venta_id = o.venta_id
INNER JOIN detalle_ordenes dor ON o.orden_id = dor.orden_id
INNER JOIN TotalCompras tc ON c.cliente_id = tc.cliente_id
WHERE
	v.fecha_venta >= DATEADD(day, -30, GETDATE())
	AND tc.total_compras > 500;
