{\rtf1\ansi\ansicpg1252\cocoartf2820
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;\f1\fnil\fcharset0 HelveticaNeue;\f2\fnil\fcharset0 Monaco;
}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;\red255\green255\blue255;\red15\green114\blue1;
\red10\green82\blue135;\red0\green0\blue0;\red71\green71\blue71;\red0\green0\blue233;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0\c84706;\cssrgb\c100000\c100000\c100000;\cssrgb\c0\c50980\c0;
\cssrgb\c0\c40000\c60000;\cssrgb\c0\c0\c0;\cssrgb\c34902\c34902\c34902;\cssrgb\c0\c0\c93333;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs53\fsmilli26667 \AppleTypeServices\AppleTypeServicesF65539 \cf2 \cb3 \expnd0\expndtw0\kerning0
Example. Random()\
\
\pard\pardeftab720\partightenfactor0

\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cf2 Setencia SQL para obtener un n\'famero aleatorio\AppleTypeServices \'a0
\f1\fs24 \cb1 \

\f0\fs29\fsmilli14667 \cb3 \'a0
\f1\fs24 \cb1 \

\f0\fs29\fsmilli14667 \cb3 \'a0
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0

\f2\fs26\fsmilli13333 \cf4 \cb3 -- Para n\'fameros enteros (entre 1 y 20)\'a0
\f1\fs24 \cf2 \cb1 \
\pard\pardeftab720\partightenfactor0

\f2\fs26\fsmilli13333 \cf5 \cb3 SELECT
\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cf2  
\f2\fs26\fsmilli13333 \AppleTypeServices ROUND(((20 - 1) * RAND() + 1), 0)\'a0
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cf2 \cb3 \uc0\u8239 \AppleTypeServices \'a0
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0

\f2\fs26\fsmilli13333 \cf4 \cb3 -- Para n\'fameros decimales\'a0
\f1\fs24 \cf2 \cb1 \
\pard\pardeftab720\partightenfactor0

\f2\fs26\fsmilli13333 \cf5 \cb3 SELECT
\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cf2  
\f2\fs26\fsmilli13333 \AppleTypeServices ROUND(((20 - 1) * RAND() + 1), 4)\'a0
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0

\f0\fs29\fsmilli14667 \cf2 \cb3 \'a0
\f1\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0

\f0 \AppleTypeServices\AppleTypeServicesF65539 \cf7 \cb3 Desde <{\field{\*\fldinst{HYPERLINK "https://desarrolladores.me/2014/04/sql-server-generar-numeros-aleatoriamente/"}}{\fldrslt \cf8 \ul \ulc8 https://desarrolladores.me/2014/04/sql-server-generar-numeros-aleatoriamente/}}>\'a0\AppleTypeServices \'a0
\f1 \cb1 \
\pard\pardeftab720\partightenfactor0

\f0\fs29\fsmilli14667 \cf2 \cb3 \'a0
\f1\fs24 \cb1 \

\f0\fs29\fsmilli14667 \cb3 \'a0}