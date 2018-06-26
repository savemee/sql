Create table Person
(
id number(3),
imie varchar(25),
nazwisko varchar(25),
id_boss number(3)
);
rollback;
drop table preson;

load data
infile 'E:\zbazy\klient.csv'
append into table Person
fields terminated by ',',lines terminated by '\n' 
(id,imie,nazwisko,id_boss)

create directory ext_tab_dir as '/path/to/dir/where/you/will/put/your/csv/files';

create sequence valuess
START WITH     1
 INCREMENT BY   1
 
CREATE OR REPLACE DIRECTORY imp_data AS 'E:\zbazy\'; 
GRANT READ, WRITE ON DIRECTORY imp_data TO PUBLIC;

CREATE TABLE imp_data (
  ID NUMBER(20),
  NAME VARCHAR2(50),
  CITY VARCHAR2(200)
)
