{\rtf1\ansi\ansicpg1252\cocoartf2820
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;\f1\fnil\fcharset0 HelveticaNeue;\f2\fswiss\fcharset0 ArialNarrow;
}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;\red255\green255\blue255;\red0\green0\blue233;
\red0\green0\blue0;\red15\green112\blue1;\red0\green0\blue255;\red124\green124\blue124;\red251\green0\blue7;
\red251\green0\blue255;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0\c84706;\cssrgb\c100000\c100000\c100000;\cssrgb\c0\c0\c93333;
\cssrgb\c0\c0\c0;\cssrgb\c0\c50196\c0;\cssrgb\c0\c0\c100000;\cssrgb\c56078\c56078\c56078;\cssrgb\c100000\c0\c0;
\cssrgb\c100000\c0\c100000;}
\margl1440\margr1440\vieww20540\viewh9780\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs53\fsmilli26667 \AppleTypeServices\AppleTypeServicesF65539 \cf2 \cb3 \expnd0\expndtw0\kerning0
Example. Hexadecimal\AppleTypeServices \'a0\
\
\pard\pardeftab720\partightenfactor0

\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cf2 Information about how to management hexa values on data\AppleTypeServices \'a0
\f1\fs24 \cb1 \

\f0\fs29\fsmilli14667 \cb3 \'a0
\f1\fs24 \cb1 \

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 Reference:\AppleTypeServices \'a0
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0
{\field{\*\fldinst{HYPERLINK "https://www.databasejournal.com/ms-sql/displaying-and-removing-unprintable-hexadecimal-characters-from-sql-server-data/"}}{\fldrslt 
\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cf4 \cb3 \ul \ulc4 https://www.databasejournal.com/ms-sql/displaying-and-removing-unprintable-hexadecimal-characters-from-sql-server-data/}}
\f0\fs29\fsmilli14667 \cb3 \'a0
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0

\f0\fs29\fsmilli14667 \cf2 \cb3 \'a0
\f1\fs24 \cb1 \

\f0\fs29\fsmilli14667 \cb3 \'a0
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0

\f2\fs29\fsmilli14667 \cf2 \cb3 \uc0\u8239 \'a0
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0

\f2\fs29\fsmilli14667 \cf6 \cb3 -- insert a TAB character into the middle of my string variable\'a0
\f1\fs24 \cf2 \cb1 \
\pard\pardeftab720\partightenfactor0

\f2\fs29\fsmilli14667 \cf7 \cb3 DECLARE\cf2  @String \cf7 varchar\cf8 (\cf2 30\cf8 )\cf2  \cf8 =\cf2  \cf9 'This is'\cf2  \cf8 +\cf2  \cf10 cast\cf8 (\cf2 0x1A \cf7 as\cf2  \cf7 varchar\cf8 (\cf2 1\cf8 ))\cf2  \cf8 +\cf2  \cf9 'my string'\cf8 ;\'a0
\f1\fs24 \cf2 \cb1 \

\f2\fs29\fsmilli14667 \cf7 \cb3 SELECT\cf2  @String \cf7 as\cf2  MyString\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0\'a0 \cf6 -- visualiza caracter no imprimible\'a0
\f1\fs24 \cf2 \cb1 \

\f2\fs29\fsmilli14667 \cf7 \cb3 SELECT\cf2  @String \cf7 as\cf2  MyString\cf8 ,\cf2  \cf10 CAST\cf8 (\cf2 @String \cf7 as\cf2  \cf7 varbinary\cf8 (\cf10 max\cf8 ))\cf2  MyString_In_Hexidecimal\cf8 ;\cf2 \'a0\'a0\'a0 \cf6 -- convierte toda la cadena en hexadecimal\'a0
\f1\fs24 \cf2 \cb1 \
\pard\pardeftab720\partightenfactor0

\f2\fs29\fsmilli14667 \cf2 \cb3 \uc0\u8239 \'a0
\f1\fs24 \cb1 \

\f2\fs29\fsmilli14667 \cb3 \uc0\u8239 \'a0
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0

\f2\fs29\fsmilli14667 \cf7 \cb3 SET\cf2  @String \cf8 =\cf2  \cf10 REPLACE\cf8 (\cf2 @String\cf8 ,\cf2 0x1A\cf8 ,\cf9 ' '\cf8 );\'a0
\f1\fs24 \cf2 \cb1 \

\f2\fs29\fsmilli14667 \cf7 \cb3 SELECT\cf2  @String \cf7 as\cf2  MyString\cf8 ,\cf2  \cf10 CAST\cf8 (\cf2 @String \cf7 as\cf2  \cf7 varbinary\cf8 (\cf10 max\cf8 ))\cf2  MyString_In_Hexidecimal\cf8 ;\'a0
\f1\fs24 \cf2 \cb1 \
\pard\pardeftab720\partightenfactor0

\f2\fs29\fsmilli14667 \cf2 \cb3 \uc0\u8239 \'a0
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0

\f2\fs29\fsmilli14667 \cf6 \cb3 --update bitacora_P1 set Observacion = REPLACE(Observacion,0x1A,' '), ObservacionPrivada = REPLACE(ObservacionPrivada,0x1A,' ');\'a0
\f1\fs24 \cf2 \cb1 \

\f2\fs29\fsmilli14667 \cf6 \cb3 --update bitacora_P2 set Observacion = REPLACE(Observacion,0x1A,' '), ObservacionPrivada = REPLACE(ObservacionPrivada,0x1A,' ');\'a0
\f1\fs24 \cf2 \cb1 \

\f2\fs29\fsmilli14667 \cf6 \cb3 --update bitacora_P3 set Observacion = REPLACE(Observacion,0x1A,' '), ObservacionPrivada = REPLACE(ObservacionPrivada,0x1A,' ');\'a0
\f1\fs24 \cf2 \cb1 \

\f2\fs29\fsmilli14667 \cf6 \cb3 --update bitacora_P4 set Observacion = REPLACE(Observacion,0x1A,' '), ObservacionPrivada = REPLACE(ObservacionPrivada,0x1A,' ');\'a0}