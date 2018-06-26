CREATE DATABASE ETL_TEST
ON
(NAME = ETL_TEST,
FILENAME = 'E:\zbazy\ETL\etl.mdf',
SIZE = 10240KB , FILEGROWTH = 1024KB )
LOG ON
(NAME = ETL_TEST_LOG,
FILENAME = 'E:\zbazy\ETL\etl.ldf',
SIZE = 1024KB , FILEGROWTH = 10%)
 -- create database 
ALTER DATABASE ETL_TEST
SET RECOVERY FULL;
-- set recovey full for database FULL recovery with log file 

use master
use ETL_TEST


CREATE SEQUENCE Testsequence
    START WITH 1  
    INCREMENT BY 1 ;  
GO  
CREATE SCHEMA Test ;   -- create schema for sequence 
GO  

CREATE SEQUENCE Test.Testsequence1  
    START WITH 1  
    INCREMENT BY 1 ;     -- create sequence testsequence1 start value 1 step 1 
GO  
SELECT * FROM sys.sequences WHERE name = 'Testsequence1' ; -- system sequence value see testsequence name 
Create table table_test
(id int IDENTITY(1,1) CONSTRAINT PK_table_test_id PRIMARY KEY,
value int not null,
 insert_date  date NOT NULL
);							-- create teble 

SELECT ABS(Checksum(NewID()) % 4) + 3; -- losowa wartosc od 3-6

select NEXT VALUE FOR Test.Testsequence1;
 insert into table_test values (NEXT VALUE FOR Test.Testsequence1,GetDate());

select * from table_test;
