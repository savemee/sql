use SaveMe_Database

Create table Person
(
id int,
imie varchar(25),
nazwisko varchar(25),
id_boss int
)

BULK insert Person
from 'E:\zbazy\klient.csv'
WITH
(
    FIRSTROW = 1,
    FIELDTERMINATOR = ',', 
    ROWTERMINATOR = '\n', 
    TABLOCK
)

select * from Person
drop table Person