use master


Create database SaveMe_Database ON
PRIMARY
( NAME = SaveMe_Database_Data, FILENAME = 'E:\zbazy\SaveMe_Database_Data.mdf'
, SIZE = 6144KB , FILEGROWTH = 1024KB )
LOG ON
( NAME = SaveMe_Database_log,
FILENAME = 'E:\zbazy\SaveMe_Database_log.ldf' ,
SIZE = 1024KB , FILEGROWTH = 10%)use SaveMe_DatabaseCreate Table osoba ( id int identity constraint osoba_pk Primary key,	imiê varchar(25) not null,	nazwisko varchar(25) not null,	plec char(1) constraint plec_ch CHECK (plec='M' or plec = 'K'))use SaveMe_DatabaseCREATE SCHEMA Test;
GOcreate sequence Test.id_next
START WITH 1
INCREMENT BY 1	;
go

Create table liczba1 (id int);

create sequence Test.tmp_id_next
START WITH 1
INCREMENT BY 1	;
go

Create table Test.tmp_liczba1 (id int);

insert into Test.tmp_liczba1 values (NEXT VALUE FOR Test.tmp_id_next);

select * from AdventureWorks2014.Person.Address
SELECT * FROM sys.sequences
select * from Test.tmp_liczba1;