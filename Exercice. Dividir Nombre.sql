{\rtf1\ansi\ansicpg1252\cocoartf2820
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;\f1\fnil\fcharset0 HelveticaNeue;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;\red255\green255\blue255;\red0\green0\blue0;
\red0\green0\blue255;\red124\green124\blue124;\red15\green112\blue1;\red251\green0\blue7;\red251\green0\blue255;
}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0\c84706;\cssrgb\c100000\c100000\c100000;\cssrgb\c0\c0\c0;
\cssrgb\c0\c0\c100000;\cssrgb\c56078\c56078\c56078;\cssrgb\c0\c50196\c0;\cssrgb\c100000\c0\c0;\cssrgb\c100000\c0\c100000;
}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs53\fsmilli26667 \AppleTypeServices\AppleTypeServicesF65539 \cf2 \cb3 \expnd0\expndtw0\kerning0
Example. Dividir Nombre\
\
\pard\pardeftab720\partightenfactor0

\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cf2 Obteniendo el nombre de una persona en una variable; el siguiente c\'f3digo realiza la separaci\'f3n del nombre en NOMBRE, APELLIDO PATERNO, APELLIDO MATERNO\AppleTypeServices \'a0
\f1\fs24 \cb1 \

\f0\fs29\fsmilli14667 \cb3 \'a0
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cf2 \cb3 \uc0\u8239 \AppleTypeServices \'a0
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cf5 \cb3 declare\cf2  @nombreProspecto \cf5 nvarchar\cf6 (\cf2 100\cf6 );\cf2  \cf7 -- esta variable es la que se tomar\'e1 de la insersi\'f3n de datos...\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \
\pard\pardeftab720\partightenfactor0

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cf2 \cb3 \uc0\u8239 \AppleTypeServices \'a0
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cf5 \cb3 declare\cf2  @_nombre \cf5 table \cf6 (\cf2 id \cf5 int\cf2  \cf5 identity\cf6 (\cf2 1\cf6 ,\cf2 1\cf6 ),\cf2  nombre \cf5 nvarchar\cf6 (\cf2 100\cf6 ))\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cf5 \cb3 declare\cf2  @_counNombre \cf5 int\cf6 ;\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cf5 \cb3 declare\cf2  @_vAPaterno \cf5 nvarchar\cf6 (\cf2 100\cf6 );\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cf5 \cb3 declare\cf2  @_vAMaterno \cf5 nvarchar\cf6 (\cf2 100\cf6 );\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cf5 \cb3 declare\cf2  @_vNombre \cf5 nvarchar\cf6 (\cf2 100\cf6 );\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \
\pard\pardeftab720\partightenfactor0

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cf2 \cb3 \uc0\u8239 \AppleTypeServices \'a0
\f1\fs24 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \uc0\u8239 \AppleTypeServices \'a0
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cf5 \cb3 set\cf2  @nombreProspecto \cf6 =\cf2  \cf8 'DANIELA CAMILA FATIMA Rub\'e9n Daniel\'a0 Marinez\'a0\'a0 Flores'\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \
\pard\pardeftab720\partightenfactor0

\f0\fs29\fsmilli14667 \cf2 \cb3 \'a0
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cf7 \cb3 -- Ie\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cf5 \cb3 set\cf2  @_counNombre \cf6 =\cf2  0\cf6 ;\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cf5 \cb3 set\cf2  @_vAPaterno \cf6 =\cf2  \cf8 ''\cf6 ;\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cf5 \cb3 set\cf2  @_vAMaterno \cf6 =\cf2  \cf8 ''\cf6 ;\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cf5 \cb3 set\cf2  @_vNombre \cf6 =\cf2  \cf8 ''\cf6 ;\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \
\pard\pardeftab720\partightenfactor0

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cf2 \cb3 \uc0\u8239 \AppleTypeServices \'a0
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cf5 \cb3 set\cf2  @nombreProspecto \cf6 =\cf2  \cf9 REPLACE\cf6 (\cf2 @nombreProspecto\cf6 ,\cf2  \cf8 '\'a0 '\cf6 ,\cf2  \cf8 ' '\cf6 );\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cf5 \cb3 set\cf2  @nombreProspecto \cf6 =\cf2  \cf9 REPLACE\cf6 (\cf2 @nombreProspecto\cf6 ,\cf2  \cf8 '\'a0 '\cf6 ,\cf2  \cf8 ' '\cf6 );\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cf5 \cb3 set\cf2  @nombreProspecto \cf6 =\cf2  \cf9 REPLACE\cf6 (\cf2 @nombreProspecto\cf6 ,\cf2  \cf8 '\'a0 '\cf6 ,\cf2  \cf8 ' '\cf6 );\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cf5 \cb3 set\cf2  @nombreProspecto \cf6 =\cf2  \cf9 REPLACE\cf6 (\cf2 @nombreProspecto\cf6 ,\cf2  \cf8 '\'a0 '\cf6 ,\cf2  \cf8 ' '\cf6 );\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cf5 \cb3 set\cf2  @nombreProspecto \cf6 =\cf2  \cf9 REPLACE\cf6 (\cf2 @nombreProspecto\cf6 ,\cf2  \cf8 '\'a0 '\cf6 ,\cf2  \cf8 ' '\cf6 );\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \
\pard\pardeftab720\partightenfactor0

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cf2 \cb3 \uc0\u8239 \AppleTypeServices \'a0
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cf5 \cb3 insert\cf2  \cf5 into\cf2  @_nombre\AppleTypeServices \'a0
\f1\fs24 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cf5 \cb3 select\cf2  \cf6 *\cf2  \cf5 from\cf2  SplitString\cf6 (\cf2 @nombreProspecto\cf6 ,\cf8 ' '\cf6 );\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \
\pard\pardeftab720\partightenfactor0

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cf2 \cb3 \uc0\u8239 \AppleTypeServices \'a0
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cf5 \cb3 set\cf2  @_counNombre \cf6 =\cf5  \cf6 (\cf5 select\cf2  \cf9 count\cf6 (*)\cf2  \cf5 from\cf2  @_nombre\cf6 );\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cf5 \cb3 if \cf6 (\cf2 @_counNombre \cf6 >\cf2  3\cf6 )\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \
\pard\pardeftab720\partightenfactor0

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cf2 \cb3 \'a0\'a0\'a0 \cf5 begin\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 set\cf2  @_vAMaterno \cf6 =\cf5  \cf6 (\cf5 select\cf2  nombre \cf5 from\cf2  @_nombre \cf5 where\cf2  id \cf6 =\cf2  @_counNombre\cf6 );\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 set\cf2  @_vAPaterno \cf6 =\cf5  \cf6 (\cf5 select\cf2  nombre \cf5 from\cf2  @_nombre \cf5 where\cf2  id \cf6 =\cf5  \cf6 (\cf2 @_counNombre \cf6 -\cf2  1\cf6 ));\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \uc0\u8239 \AppleTypeServices \'a0
\f1\fs24 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 declare\cf2  @_contador \cf5 int\cf2  \cf6 =\cf2  1\cf6 ;\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 set\cf2  @_vNombre \cf6 =\cf2  \cf8 ''\cf6 ;\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 while \cf6 (\cf2 @_contador \cf6 <\cf5 \'a0 \cf6 (\cf2 @_counNombre \cf6 -\cf2  1\cf6 ))\cf2  \cf5 BEGIN\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 if \cf6 (\cf2 @_contador \cf6 >\cf2  1\cf6 )\cf2 \'a0\AppleTypeServices \'a0
\f1\fs24 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 set\cf2  @_vNombre \cf6 =\cf2  @_vNombre \cf6 +\cf2  \cf8 ' '\cf6 ;\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\AppleTypeServices \'a0
\f1\fs24 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 set\cf2  @_vNombre \cf6 =\cf2  @_vNombre \cf6 +\cf5  \cf6 (\cf5 select\cf2  nombre \cf5 from\cf2  @_nombre \cf5 where\cf2  id \cf6 =\cf2  @_contador\cf6 );\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 set\cf2  @_contador \cf6 +=\cf2  1\cf6 ;\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 end\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \uc0\u8239 \AppleTypeServices \'a0
\f1\fs24 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \'a0\'a0\'a0 \cf5 end\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \
\pard\pardeftab720\partightenfactor0

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cf5 \cb3 else\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \
\pard\pardeftab720\partightenfactor0

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cf2 \cb3 \'a0\'a0\'a0 \cf5 begin\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 if \cf6 (\cf2 @_counNombre \cf6 =\cf2  3\cf6 )\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 begin\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 set\cf2  @_vNombre \cf6 =\cf5  \cf6 (\cf5 select\cf2  nombre \cf5 from\cf2  @_nombre \cf5 where\cf2  id \cf6 =\cf2  1\cf6 )\cf2  \cf6 ;\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 set\cf2  @_vAPaterno \cf6 =\cf5  \cf6 (\cf5 select\cf2  nombre \cf5 from\cf2  @_nombre \cf5 where\cf2  id \cf6 =\cf2  2\cf6 )\cf2  \cf6 ;\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 set\cf2  @_vAMaterno \cf6 =\cf5  \cf6 (\cf5 select\cf2  nombre \cf5 from\cf2  @_nombre \cf5 where\cf2  id \cf6 =\cf2  3\cf6 )\cf2  \cf6 ;\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 end\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 else\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 begin\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 if \cf6 (\cf2 @_counNombre \cf6 =\cf2  2\cf6 )\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 begin\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 set\cf2  @_vNombre \cf6 =\cf5  \cf6 (\cf5 select\cf2  nombre \cf5 from\cf2  @_nombre \cf5 where\cf2  id \cf6 =\cf2  1\cf6 )\cf2  \cf6 ;\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 set\cf2  @_vAPaterno \cf6 =\cf5  \cf6 (\cf5 select\cf2  nombre \cf5 from\cf2  @_nombre \cf5 where\cf2  id \cf6 =\cf2  2\cf6 )\cf2  \cf6 ;\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 set\cf2  @_vAMaterno \cf6 =\cf2  \cf8 '<< no asignado >>'\cf6 ;\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 end\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 else\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 begin\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 set\cf2  @_vNombre \cf6 =\cf2  @nombreProspecto\cf6 ;\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 set\cf2  @_vAPaterno \cf6 =\cf2  \cf8 '<< no asignado >>'\cf6 ;\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 set\cf2  @_vAMaterno \cf6 =\cf2  \cf8 '<< no asignado >>'\cf6 ;\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 end\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf5 end\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \'a0\'a0\'a0 \cf5 end\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \uc0\u8239 \AppleTypeServices \'a0
\f1\fs24 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \uc0\u8239 \AppleTypeServices \'a0
\f1\fs24 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \'a0\cf7 --select * from @_nombre;\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \'a0\cf7 --select @_vNombre + ' ' + @_vAPaterno + ' ' + @_vAPaterno;\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \uc0\u8239 \AppleTypeServices \'a0
\f1\fs24 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \'a0\cf5 PRINT\cf2  \cf8 'NOMBRE: '\cf2  \cf6 +\cf2  @_vNombre\cf6 ;\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \'a0\cf5 PRINT\cf2  \cf8 'NOMBRE: '\cf2  \cf6 +\cf2  @_vAPaterno\cf6 ;\AppleTypeServices \'a0
\f1\fs24 \cf2 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 \'a0\cf5 PRINT\cf2  \cf8 'NOMBRE: '\cf2  \cf6 +\cf2  @_vAPaterno\cf6 ;\AppleTypeServices \'a0}