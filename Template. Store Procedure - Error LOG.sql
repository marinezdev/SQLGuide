{\rtf1\ansi\ansicpg1252\cocoartf2820
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;\f1\fswiss\fcharset0 ArialNarrow;\f2\fnil\fcharset0 HelveticaNeue;
}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;\red255\green255\blue255;\red15\green112\blue1;
\red0\green0\blue255;\red124\green124\blue124;\red251\green0\blue255;\red251\green0\blue7;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0\c84706;\cssrgb\c100000\c100000\c100000;\cssrgb\c0\c50196\c0;
\cssrgb\c0\c0\c100000;\cssrgb\c56078\c56078\c56078;\cssrgb\c100000\c0\c100000;\cssrgb\c100000\c0\c0;}
\margl1440\margr1440\vieww23340\viewh14080\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs53\fsmilli26667 \AppleTypeServices\AppleTypeServicesF65539 \cf2 \cb3 \expnd0\expndtw0\kerning0
Store Procedure - Error LOG\AppleTypeServices \'a0 (template)\
\
\
\pard\pardeftab720\partightenfactor0

\f1\fs29\fsmilli14667 \cf2 \'a0\'a0\'a0 \cf4 -- tabla para el manejo de Log\'a0\'a0\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0 \cf4 -- (crear si no existe y complementar en caso de que le hagan falta campos)\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0 \cf5 create\cf2  \cf5 table\cf2  _logSystem\cf6 (\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0 Id \cf5 int\cf2  \cf5 identity\cf6 (\cf2 1\cf6 ,\cf2 1\cf6 )\cf2  \cf5 primary\cf2  \cf5 key\cf2  \cf6 not\cf2  \cf6 null,\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0 Tipo \cf5 nvarchar\cf6 (\cf2 50\cf6 )\cf2  \cf6 not\cf2  \cf6 null,\cf2 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf4 -- Tiipo de LOG\'a0 // error, informacion, warning, update, insert, delete, etc...\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0 Fecha \cf5 datetime\cf2  \cf6 not\cf2  \cf6 null,\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0 Numero \cf5 nvarchar\cf6 (\cf7 max\cf6 )\cf2  \cf6 null,\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0 Severidad \cf5 nvarchar\cf6 (\cf7 max\cf6 )\cf2  \cf6 null,\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0 Estado \cf5 nvarchar\cf6 (\cf7 max\cf6 )\cf2  \cf6 NULL,\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0 Procedimiento \cf5 nvarchar\cf6 (\cf7 max\cf6 )\cf2  \cf6 null,\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0 Linia \cf5 nvarchar\cf6 (\cf7 max\cf6 )\cf2  \cf6 null,\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0 Mensaje \cf5 nvarchar\cf6 (\cf7 max\cf6 ) null\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cf4 \cb3 -- Agregar informaci\'f3n del inicio de sesi\'f3n\'a0 (sistema operativo, navegador, ips)\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0 \cf6 )\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0 \cf5 go\'a0
\f2\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \cb3 \uc0\u8239 
\f1 \'a0
\f2\fs24 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0 \cf4 -- <summary>\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0 \cf4 --\'a0\'a0\'a0\'a0\'a0\'a0\'a0 indicate the summary of the main functionality to which the module is focused\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0 \cf4 -- </summary>\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0 \cf4 -- <param name="@parameter1">define the parameter data</param>\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0 \cf4 -- <param name="@parameter2">define the parameter data</param>\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0 \cf4 -- <remarks>\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0 \cf4 --\'a0\'a0\'a0\'a0\'a0\'a0\'a0 indicate the important notes about functionality\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0 \cf4 -- </remarks>\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0 \cf4 -- <returns>\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0 \cf4 --\'a0\'a0\'a0\'a0\'a0\'a0\'a0 indicate result data type and description informaction to its implemantation\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0 \cf4 -- </returns>\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0 \cf5 create\cf2  \cf5 procedure\cf2  NombreStoreProcedura\'a0
\f2\fs24 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0 @parameter1 \cf5 nvarchar\cf6 (\cf2 6\cf6 ),\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0 @parameter2 \cf5 nvarchar\cf6 (\cf2 6\cf6 )\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0 \cf5 as\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0 \cf5 begin\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf4 -- =================================================================================================================== --\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf4 --\'a0 Encabezado Store -- <inicio>\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 begin tran\cf6 ;\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 set nocount on\cf6 ;\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 declare\cf2  @_errorNumber \cf5 int\cf6 ;\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 set\cf2  @_errorNumber \cf6 =\cf2  0\cf6 ;\'a0
\f2\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \cb3 \uc0\u8239 
\f1 \'a0
\f2\fs24 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 begin\cf2  \cf5 try\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf4 --\'a0 Contenido Store -- <inicio>\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 declare\cf2  @a \cf5 int\cf6 ;\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 declare\cf2  @b \cf5 int\cf6 ;\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 declare\cf2  @c \cf5 int\cf6 ;\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0
\f2\fs24 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 set\cf2  @a \cf6 =\cf2  100\cf6 ;\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 set\cf2  @b \cf6 =\cf2  0\cf6 ;\'a0
\f2\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \cb3 \uc0\u8239 
\f1 \'a0
\f2\fs24 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 if \cf6 (\cf2 @b \cf6 =\cf2  0\cf6 )\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 set\cf2  @_errorNumber \cf6 =\cf2  99001\cf6 ;\cf2  \cf4 -- custom error definition\'a0
\f2\fs24 \cf2 \cb1 \
\pard\pardeftab720\partightenfactor0

\f1\fs29\fsmilli14667 \cf4 \cb3 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 -- Manejo de errores personalizado\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cf4 \cb3 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 --\'a0RAISERROR (\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cf4 \cb3 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 --\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 N'This is message %s %d %d.', -- Message text.\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cf4 \cb3 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 --\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 16, -- Severity (la serveridad tiene que ser 16 si deseamos que sea capturado por el try catch),\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cf4 \cb3 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 --\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 1, -- State,\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cf4 \cb3 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 --\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 N'number', -- First argument.\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cf4 \cb3 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 --\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 5, -- second argument\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cf4 \cb3 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 \'a0 --\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 10 -- threeth argument\'a0
\f0 \cf2 \uc0\u8239 
\f1 \'a0\
\pard\pardeftab720\partightenfactor0

\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 set\cf2  @c \cf6 =\cf2  @a \cf6 /\cf2  @b\cf6 ;\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf4 --\'a0 Contenido Store -- <final>\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 end\cf2  \cf5 try\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 begin\cf2  \cf5 catch\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf4 -- aqui lo que se podr\'eda hacer es llamar a un store para almacenar el error... Indicando el usuario y la fecha en que se genera... Y si se puede toda la informaci\'f3n del login (sistema operativo, ip, navegador, etc)\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 declare\cf2  @_IdLog \cf5 int\cf6 ;\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 set\cf2  @_errorNumber \cf6 =\cf5  \cf6 (\cf5 select\cf2  \cf7 ERROR_NUMBER\cf6 ());\'a0
\f2\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \cb3 \uc0\u8239 
\f1 \'a0
\f2\fs24 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 insert\cf2  \cf5 into\cf2  _logSystem\'a0
\f2\fs24 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 select\cf2 \'a0\'a0
\f2\fs24 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf8 'ERROR'\cf2  \cf5 AS\cf2  \cf8 'Tipo'\cf2 \'a0\'a0\'a0
\f2\fs24 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf6 ,\cf2  \cf7 GETDATE\cf6 ()\cf2  \cf5 AS\cf2  \cf8 'Fecha'\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf6 ,\cf2  \cf7 ERROR_NUMBER\cf6 ()\cf2  \cf5 AS\cf2  ErrorNumber\'a0\'a0\'a0
\f2\fs24 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf6 ,\cf2  \cf7 ERROR_SEVERITY\cf6 ()\cf2  \cf5 AS\cf2  ErrorSeverity\'a0\'a0\'a0
\f2\fs24 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf6 ,\cf2  \cf7 ERROR_STATE\cf6 ()\cf2  \cf5 AS\cf2  ErrorState\'a0\'a0\'a0
\f2\fs24 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf6 ,\cf2  \cf7 ERROR_PROCEDURE\cf6 ()\cf2  \cf5 AS\cf2  ErrorProcedure\'a0\'a0\'a0
\f2\fs24 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf6 ,\cf2  \cf7 ERROR_LINE\cf6 ()\cf2  \cf5 AS\cf2  ErrorLine\'a0\'a0\'a0
\f2\fs24 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf6 ,\cf2  \cf7 ERROR_MESSAGE\cf6 ()\cf2  \cf5 AS\cf2  ErrorMessage\cf6 ;\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0
\f2\fs24 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 select\cf2  \cf6 *\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 from\cf2  _logSystem\'a0
\f2\fs24 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 where\cf2  _logSystem\cf6 .\cf2 Id \cf6 =\cf2  @_IdLog\cf6 ;\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 end\cf2  \cf5 catch\'a0
\f2\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \cb3 \uc0\u8239 
\f1 \'a0
\f2\fs24 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf4 --\'a0 Finalizaci\'f3n Store -- <inicio>\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 if \cf6 (\cf2 @_errorNumber \cf6 =\cf2  0\cf6 )\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 commit\cf6 ;\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 else\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 rollback\cf6 ;\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf4 -- =================================================================================================================== --\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs29\fsmilli14667 \cb3 \'a0\'a0\'a0 \cf5 end\'a0}