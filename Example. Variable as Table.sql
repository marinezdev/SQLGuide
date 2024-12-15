{\rtf1\ansi\ansicpg1252\cocoartf2820
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;\f1\fnil\fcharset0 Menlo-Regular;\f2\fnil\fcharset0 HelveticaNeue;
}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;\red255\green255\blue255;\red0\green0\blue0;
\red0\green0\blue255;\red124\green124\blue124;\red251\green0\blue255;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0\c84706;\cssrgb\c100000\c100000\c100000;\cssrgb\c0\c0\c0;
\cssrgb\c0\c0\c100000;\cssrgb\c56078\c56078\c56078;\cssrgb\c100000\c0\c100000;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs53\fsmilli26667 \AppleTypeServices\AppleTypeServicesF65539 \cf2 \cb3 \expnd0\expndtw0\kerning0
Example. Variable as Table\
\
\pard\pardeftab720\partightenfactor0

\f1\fs25\fsmilli12667 \AppleTypeServices \cf2 Se crea una variable de tipo tabla y se puede utilizar como una tabla\'a0de base de datos\'a0
\f2\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0

\f1\fs25\fsmilli12667 \cf5 \cb3 \'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs25\fsmilli12667 \cf5 \cb3 DECLARE\cf2  @product_table \cf5 TABLE \cf6 (\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs25\fsmilli12667 \cb3 \'a0\'a0\'a0 product_name \cf5 VARCHAR\cf6 (\cf7 MAX\cf6 )\cf2  \cf6 NOT\cf2  \cf6 NULL,\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs25\fsmilli12667 \cb3 \'a0\'a0\'a0 brand_id \cf5 INT\cf2  \cf6 NOT\cf2  \cf6 NULL,\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs25\fsmilli12667 \cb3 \'a0\'a0\'a0 list_price \cf5 DEC\cf6 (\cf2 11\cf6 ,\cf2 2\cf6 )\cf2  \cf6 NOT\cf2  \cf6 NULL\'a0
\f2\fs24 \cf2 \cb1 \

\f1\fs25\fsmilli12667 \cf6 \cb3 );\'a0
\f2\fs24 \cf2 \cb1 \
\pard\pardeftab720\partightenfactor0

\f0\fs29\fsmilli14667 \AppleTypeServices\AppleTypeServicesF65539 \cf2 \cb3 \uc0\u8239 \AppleTypeServices \'a0
\f2\fs24 \cb1 \
\pard\pardeftab720\partightenfactor0

\f0\fs25\fsmilli12667 \AppleTypeServices\AppleTypeServicesF65539 \cf2 \cb3 insert into\'a0@product_table (product_name, brand_id, list_price) values ('analgesico', 1001, 10.50);\AppleTypeServices \'a0
\f2\fs24 \cb1 \

\f0\fs25\fsmilli12667 \AppleTypeServices\AppleTypeServicesF65539 \cb3 Select * from\'a0@product_table\AppleTypeServices \'a0}