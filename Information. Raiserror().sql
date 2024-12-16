-- Manejo de errores personalizado 
 
RAISERROR ( 
                N'This is message %s %d %d.', -- Message text. 
                16, -- Severity (la serveridad tiene que ser 16 si deseamos que sea capturado por el try catch), 
                1, -- State, 
                N'number', -- First argument. 
                5, -- second argument 
                10 -- threeth argument 
);

-- este seria el llamado de la función RAISERROR()
