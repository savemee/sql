-- USUNI�CIE TABEL: PLACOWKI, WYKSZTALCENIE, PRACOWNICY, KURSY, UCZESTNICTWO
DROP TABLE PRACOWNICY CASCADE CONSTRAINTS;
DROP TABLE UCZESTNICTWO CASCADE CONSTRAINTS;
DROP TABLE KURSY CASCADE CONSTRAINTS;
DROP TABLE WYKSZTALCENIE CASCADE CONSTRAINTS;
DROP TABLE PLACOWKI CASCADE CONSTRAINTS;
-- UTWORZENIE TABEL: PLACOWKI, WYKSZTALCENIE, PRACOWNICY, KURSY, UCZESTNICTWO
-- UTWORZENIE TABELI PLACOWKI
CREATE TABLE PLACOWKI (
ID_PLACOWKI NUMBER(2) CONSTRAINT PLAC_PK PRIMARY KEY,
NAZWA VARCHAR2(30) NOT NULL,
MIEJSCOWOSC VARCHAR2(30) NOT NULL,
KOD VARCHAR2(6) NOT NULL,
ULICA VARCHAR2(20) NOT NULL,
NR_DOMU VARCHAR2(8)
);
-- WSTAWIENIE DANYCH
INSERT INTO PLACOWKI VALUES (1, 'BIURO', '��D�', '90-430', 'PIOTRKOWSKA', '113');
INSERT INTO PLACOWKI VALUES (2, 'SKLEP I', '��D�', '90-430', 'PIOTRKOWSKA', '113');
INSERT INTO PLACOWKI VALUES (3, 'SKLEP II', '��D�', '90-269', 'PIOTRKOWSKA', '26');
INSERT INTO PLACOWKI VALUES (4, 'SKLEP III', 'PABIANICE', '95-020', 'WILE�SKA', '23');
INSERT INTO PLACOWKI VALUES (5, 'SKLEP IV', 'ZGIERZ', '95-100', 'SUKIENNICZA','12');
INSERT INTO PLACOWKI VALUES (6, 'MAGAZYN', 'ZGIERZ', '95-100', 'SUKIENNICZA', '14');
INSERT INTO PLACOWKI VALUES (7, 'SKLEP V', '��D�' ,'93-317', 'RZGOWSKA', '227');
-- UTWORZENIE TABELI WYKSZTALCENIE
CREATE TABLE WYKSZTALCENIE (
ID_WYKSZTALCENIA NUMBER(1) CONSTRAINT WYKSZT_PK PRIMARY KEY,
POZIOM VARCHAR2(30) NOT NULL
);
-- WSTAWIENIE DANYCH
INSERT INTO WYKSZTALCENIE VALUES (1, 'PODSTAWOWE');
INSERT INTO WYKSZTALCENIE VALUES (2, 'GIMNAZJALNE');
INSERT INTO WYKSZTALCENIE VALUES (3, 'ZASADNICZE ZAWODOWE');
INSERT INTO WYKSZTALCENIE VALUES (4, '�REDNIE');
INSERT INTO WYKSZTALCENIE VALUES (5, 'WY�SZE');
-- UTWORZENIE TABELI PRACOWNICY
CREATE TABLE PRACOWNICY (
ID_PRACOWNIKA NUMBER(2) CONSTRAINT PRAC_PK PRIMARY KEY,
IMIE VARCHAR2(15) NOT NULL,
NAZWISKO VARCHAR2(45) NOT NULL,
PLEC CHAR(1) NOT NULL CONSTRAINT PRAC_CH CHECK (PLEC IN ('K', 'M')),
DATA_URODZENIA DATE NOT NULL,
PESEL CHAR(11) NOT NULL CONSTRAINT PRAC_PESEL UNIQUE,
DATA_ZATRUDNIENIA DATE NOT NULL,
ZAWOD VARCHAR2(25) NOT NULL,
PENSJA NUMBER(7,2) NOT NULL,
DODATEK NUMBER(7,2),
ID_SZEFA NUMBER(2) CONSTRAINT PRAC_SK REFERENCES PRACOWNICY(ID_PRACOWNIKA),
ID_PLACOWKI NUMBER(2) NOT NULL,
ID_WYKSZTALCENIA NUMBER(1) NOT NULL,
CONSTRAINT PRAC_PLAC_FK FOREIGN KEY (ID_PLACOWKI) REFERENCES PLACOWKI (ID_PLACOWKI),
CONSTRAINT PRAC_WYKSZT_FK FOREIGN KEY (ID_WYKSZTALCENIA) REFERENCES WYKSZTALCENIE
(ID_WYKSZTALCENIA),
CONSTRAINT PRAC_D_CH CHECK (DATA_URODZENIA<DATA_ZATRUDNIENIA)
);
-- UTWORZENIE INDEKSU
CREATE INDEX PRAC_NAZWISKO ON PRACOWNICY(NAZWISKO);
-- WSTAWIENIE DANYCH
INSERT INTO PRACOWNICY VALUES(
1,'KRZYSZTOF','KONECKI','M',TO_DATE('05/11/1967','DD/MM/YYYY'),'67110512816',
TO_DATE('11/10/1999','DD/MM/YYYY'),'EKONOMISTA',6900,NULL,NULL,1,5);
INSERT INTO PRACOWNICY VALUES(
2,'KATARZYNA','WO�NIAK','K',TO_DATE('15/07/1976','DD/MM/YYYY'),'76071509449',
TO_DATE('11/10/1999','DD/MM/YYYY'),'SEKRETARKA',2500,2300,1,1,5);
INSERT INTO PRACOWNICY VALUES(
22,'MA�GORZATA','RADOMSKA','K',TO_DATE('23/05/1967','DD/MM/YYYY'),'67052357665',
TO_DATE('01/01/2001','DD/MM/YYYY'),'PRAWNIK',5500,NULL,1,1,5);
INSERT INTO PRACOWNICY VALUES(
17,'STEFAN','PUCHALSKI','M',TO_DATE('24/12/1958','DD/MM/YYYY'),'58122478773',
TO_DATE('15/08/2000','DD/MM/YYYY'),'KIEROWCA',1500,NULL,1,1,4);
INSERT INTO PRACOWNICY VALUES(
4,'BARBARA','KLIMCZAK','K',TO_DATE('16/01/1954','DD/MM/YYYY'),'54011636765',
TO_DATE('11/10/1999','DD/MM/YYYY'),'KSI�GOWA',4400,NULL,22,1,5);
INSERT INTO PRACOWNICY VALUES(
5,'EL�BIETA','FRASZKA','K',TO_DATE('27/03/1968','DD/MM/YYYY'),'68032723801',
TO_DATE('11/10/1999','DD/MM/YYYY'),'PROJEKTANT',4400,1500,22,1,5);
INSERT INTO PRACOWNICY VALUES(
6,'MARTA','BALCERZYK','K',TO_DATE('13/07/1974','DD/MM/YYYY'),'74071335781',
TO_DATE('01/01/2000','DD/MM/YYYY'),'SPRZEDAWCA',1650,500,22,2,5);
INSERT INTO PRACOWNICY VALUES(
8,'ANNA','KOWALSKA','K',TO_DATE('17/03/1976','DD/MM/YYYY'),'76031746745',
TO_DATE('01/01/2000','DD/MM/YYYY'),'KASJER',1650,NULL,6,2,4);
INSERT INTO PRACOWNICY VALUES(
10,'PAWE�','ZIMNICKI','M',TO_DATE('19/10/1978','DD/MM/YYYY'),'78101908736',
TO_DATE('01/01/2000','DD/MM/YYYY'),'MAGAZYNIER',1300,800,22,6,4);
INSERT INTO PRACOWNICY VALUES(
13,'ZOFIA','KOPER','K',TO_DATE('08/10/1955','DD/MM/YYYY'),'55100824665',
TO_DATE('15/02/2000','DD/MM/YYYY'),'SPRZ�TACZKA',1050,NULL,6,2,3);
INSERT INTO PRACOWNICY VALUES(
14,'MAGDALENA','FRASZKA','K',TO_DATE('27/09/1976','DD/MM/YYYY'),'76092736884',
TO_DATE('01/06/2000','DD/MM/YYYY'),'PLASTYK',3300,NULL,22,1,5);
INSERT INTO PRACOWNICY VALUES(
11,'TOMASZ','KRAJEWSKI','M',TO_DATE('18/04/1960','DD/MM/YYYY'),'60041835052',
TO_DATE('15/02/2000','DD/MM/YYYY'),'SPRZEDAWCA',1600,650,22,3,4);
INSERT INTO PRACOWNICY VALUES(
15,'EWELINA','GOSZCZY�SKA','K',TO_DATE('18/02/1981','DD/MM/YYYY'),'81021860424',
TO_DATE('01/06/2000','DD/MM/YYYY'),'KASJER',1600,NULL,11,3,4);
INSERT INTO PRACOWNICY VALUES(
16,'KRYSTYNA','RACZKOWSKA','K',TO_DATE('25/09/1961','DD/MM/YYYY'),'61092562102',
TO_DATE('01/06/2000','DD/MM/YYYY'),'SPRZEDAWCA',1600,500,22,4,5);
INSERT INTO PRACOWNICY VALUES(
18,'PIOTR','OKO�','M',TO_DATE('19/09/1977','DD/MM/YYYY'),'77091956714',
TO_DATE('30/09/2000','DD/MM/YYYY'),'SPRZEDAWCA',1550,500,22,5,3);
INSERT INTO PRACOWNICY VALUES(
20,'HANNA','SOBCZAK','K',TO_DATE('14/08/1957','DD/MM/YYYY'),'57081468326',
TO_DATE('01/01/2001','DD/MM/YYYY'),'SPRZ�TACZKA',1000,NULL,11,3,4);
INSERT INTO PRACOWNICY VALUES(
25,'BART�OMIEJ','LULEK','M',TO_DATE('13/01/1979','DD/MM/YYYY'),'79011314455',
TO_DATE('01/02/2001','DD/MM/YYYY'),'KASJER',1570,NULL,11,3,4);
INSERT INTO PRACOWNICY VALUES(
26,'JAKUB','TURKOWSKI','M',TO_DATE('14/08/1973','DD/MM/YYYY'),'73081468395',
TO_DATE('01/03/2001','DD/MM/YYYY'),'PROJEKTANT',3300,NULL,5,1,5);
INSERT INTO PRACOWNICY VALUES(
27,'TOMASZ','KOWALSKI','M',TO_DATE('08/10/1955','DD/MM/YYYY'),'55100878138',
TO_DATE('14/05/2001','DD/MM/YYYY'),'MAGAZYNIER',1250,NULL,10,6,4);
INSERT INTO PRACOWNICY VALUES(
30,'GRZEGORZ','LENART','M',TO_DATE('06/03/1959','DD/MM/YYYY'),'59030637870',
TO_DATE('02/06/2003','DD/MM/YYYY'),'SPRZEDAWCA',1500,NULL,11,3,3);
INSERT INTO PRACOWNICY VALUES(
31,'MICHA�','WILCZAK','M',TO_DATE('19/11/1985','DD/MM/YYYY'),'85111958914',
TO_DATE('02/06/2003','DD/MM/YYYY'),'SPRZEDAWCA',1500,NULL,18,5,4);
INSERT INTO PRACOWNICY VALUES(
32,'ANETA','ZAB�OCKA','K',TO_DATE('24/04/1976','DD/MM/YYYY'),'76042479821',
TO_DATE('02/06/2003','DD/MM/YYYY'),'KASJER',1530,NULL,16,4,4);
INSERT INTO PRACOWNICY VALUES(
34,'MIKO�AJ','ZATORSKI','M',TO_DATE('12/07/1982','DD/MM/YYYY'),'82071279037',
TO_DATE('02/06/2003','DD/MM/YYYY'),'SPRZEDAWCA',1500,NULL,6,2,4);
INSERT INTO PRACOWNICY VALUES(
35,'DAMIAN','JӏWIAK','M',TO_DATE('28/02/1984','DD/MM/YYYY'),'84022869898',
TO_DATE('01/01/2004','DD/MM/YYYY'),'SPRZEDAWCA',1450,NULL,11,3,4);
INSERT INTO PRACOWNICY VALUES(
36,'MARIA','SOBCZAK','K',TO_DATE('11/08/1960','DD/MM/YYYY'),'60081169081',
TO_DATE('01/01/2004','DD/MM/YYYY'),'KASJER',1500,NULL,18,5,4);
INSERT INTO PRACOWNICY VALUES(
37,'EDYTA','KRUPI�SKA','K',TO_DATE('09/09/1978','DD/MM/YYYY'),'78090974020',
TO_DATE('20/05/2004','DD/MM/YYYY'),'SPRZEDAWCA',1400,NULL,18,5,3);
INSERT INTO PRACOWNICY VALUES(
40,'PIOTR','IWANOWSKI','M',TO_DATE('03/06/1979','DD/MM/YYYY'),'79060368917',
TO_DATE('01/10/2004','DD/MM/YYYY'),'SPRZEDAWCA',1350,NULL,16,4,3);
INSERT INTO PRACOWNICY VALUES(
41,'RAFA�','DZI�CIO�','M',TO_DATE('01/04/1976','DD/MM/YYYY'),'76040158917',
TO_DATE('09/12/2004','DD/MM/YYYY'),'PROJEKTANT',2750,NULL,5,1,5);
INSERT INTO PRACOWNICY VALUES(
42,'WOJCIECH','CELI�SKI','M',TO_DATE('30/05/1980','DD/MM/YYYY'),'80053079332',
TO_DATE('25/04/2005','DD/MM/YYYY'),'INFORMATYK',2950,2000,22,1,5);
INSERT INTO PRACOWNICY VALUES(
43,'KAROLINA','EKIERT','K',TO_DATE('27/01/1983','DD/MM/YYYY'),'83012715788',
TO_DATE('08/08/2005','DD/MM/YYYY'),'KASJER',1400,NULL,11,3,4);
INSERT INTO PRACOWNICY VALUES(
44,'ZDZIS�AW','GRZYWACZ','M',TO_DATE('30/03/1950','DD/MM/YYYY'),'50033046911',
TO_DATE('15/08/2005','DD/MM/YYYY'),'MAGAZYNIER',1200,NULL,10,6,4);
INSERT INTO PRACOWNICY VALUES(
45,'MATEUSZ','LENARTOWICZ','M',TO_DATE('17/06/1986','DD/MM/YYYY'),'86061752739',
TO_DATE('05/11/2005','DD/MM/YYYY'),'KIEROWCA',1300,NULL,10,6,5);
INSERT INTO PRACOWNICY VALUES(
46,'BARBARA','MAJCHEREK','K',TO_DATE('16/07/1957','DD/MM/YYYY'),'57071647841',
TO_DATE('23/12/2005','DD/MM/YYYY'),'KASJER',1375,NULL,18,5,5);
INSERT INTO PRACOWNICY VALUES(
47,'S�AWOMIRA','MIARECKA','K',TO_DATE('15/02/1958','DD/MM/YYYY'),'58021541383',
TO_DATE('02/01/2006','DD/MM/YYYY'),'PLASTYK',2200,NULL,14,1,4);
INSERT INTO PRACOWNICY VALUES(
49,'WOJCIECH','PALMOWSKI','M',TO_DATE('03/04/1977','DD/MM/YYYY'),'77040315791',
TO_DATE('20/03/2006','DD/MM/YYYY'),'SPRZEDAWCA',1360,NULL,16,4,4);
INSERT INTO PRACOWNICY VALUES(
50,'MONIKA','PIOTROWSKA','K',TO_DATE('19/09/1981','DD/MM/YYYY'),'81091907823',
TO_DATE('14/04/2006','DD/MM/YYYY'),'SPRZ�TACZKA',970,NULL,16,4,3);
INSERT INTO PRACOWNICY VALUES(
51,'JOLANTA','NOWAK','K',TO_DATE('04/07/1971','DD/MM/YYYY'),'71070427183',
TO_DATE('01/07/2006','DD/MM/YYYY'),'SPRZEDAWCA',1300,NULL,11,3,4);
INSERT INTO PRACOWNICY VALUES(
52,'MARIOLA','NOWAK','K',TO_DATE('12/02/1969','DD/MM/YYYY'),'69021228440',
TO_DATE('01/08/2006','DD/MM/YYYY'),'SPRZ�TACZKA',950,NULL,18,5,3);
INSERT INTO PRACOWNICY VALUES(
53,'TOMASZ','PRZYBYLSKI','M',TO_DATE('30/12/1973','DD/MM/YYYY'),'73123083775',
TO_DATE('12/09/2006','DD/MM/YYYY'),'ANALITYK RYNKU',2300,550,22,1,5);
INSERT INTO PRACOWNICY VALUES(
54,'NATALIA','ROGULSKA','K',TO_DATE('11/11/1984','DD/MM/YYYY'),'84111135141',
TO_DATE('18/09/2006','DD/MM/YYYY'),'PROJEKTANT',2000,NULL,5,1,5);
INSERT INTO PRACOWNICY VALUES(
55,'ROMAN','KOWALSKI','M',TO_DATE('15/05/1965','DD/MM/YYYY'),'65051548138',
TO_DATE('20/09/2006','DD/MM/YYYY'),'KIEROWCA',1200,NULL,22,1,3);
INSERT INTO PRACOWNICY VALUES(
29,'DOROTA','MIKO�AJCZYK','K',TO_DATE('26/05/1980','DD/MM/YYYY'),'80052687589',
TO_DATE('01/10/2001','DD/MM/YYYY'),'SEKRETARKA',1900,NULL,22,1,4);
INSERT INTO PRACOWNICY VALUES(
33,'KATARZYNA','�UCZAK','K',TO_DATE('02/10/1981','DD/MM/YYYY'),'81100258924',
TO_DATE('02/06/2003','DD/MM/YYYY'),'KASJER',1530,NULL,16,4,4);
INSERT INTO PRACOWNICY VALUES(
39,'ANNA','KOWALSKA','K',TO_DATE('30/10/1976','DD/MM/YYYY'),'76103082360',
TO_DATE('01/07/2004','DD/MM/YYYY'),'SPECJALISTA DS. REKLAMY',2950,550,22,1,5);
-- UTWORZENIE TABELI KURSY
CREATE TABLE KURSY (
ID_KURSU NUMBER(3) CONSTRAINT KURS_PK PRIMARY KEY,
NAZWA VARCHAR2(80) NOT NULL,
LICZBA_GODZIN NUMBER(2) DEFAULT 60 NOT NULL CONSTRAINT KURS_CH CHECK (LICZBA_GODZIN>0)
);
-- WSTAWIENIE DANYCH
INSERT INTO KURSY VALUES(1,'NOWOCZESNA REKLAMA',10);
INSERT INTO KURSY VALUES(2,'ANGIELSKI W BIZNESIE',60);
INSERT INTO KURSY VALUES(3,'GRAFIKA NA STRONACH WWW',30);
INSERT INTO KURSY VALUES(4,'KURS SPRZEDAWCY Z OBS�UG� KAS FISKALNYCH I KOMPUTERA',60);
INSERT INTO KURSY VALUES(5,'SKUTECZNY SPRZEDAWCA',15);
INSERT INTO KURSY VALUES(6,'SEKRETARKA-ASYSTENTKA MENED�ERA',55);
-- UTWORZENIE TABELI UCZESTNICTWO
CREATE TABLE UCZESTNICTWO (
ID_KURSU NUMBER(3) NOT NULL REFERENCES KURSY(ID_KURSU),
ID_PRACOWNIKA NUMBER(3) NOT NULL REFERENCES PRACOWNICY(ID_PRACOWNIKA),
CONSTRAINT UCZEST_PK PRIMARY KEY (ID_KURSU, ID_PRACOWNIKA)
);
-- WSTAWIENIE DANYCH
INSERT INTO UCZESTNICTWO VALUES (1,39);
INSERT INTO UCZESTNICTWO VALUES (1,47);
INSERT INTO UCZESTNICTWO VALUES (1,14);
INSERT INTO UCZESTNICTWO VALUES (2,1);
INSERT INTO UCZESTNICTWO VALUES (2,22);
INSERT INTO UCZESTNICTWO VALUES (2,2);
INSERT INTO UCZESTNICTWO VALUES (3,14);
INSERT INTO UCZESTNICTWO VALUES (3,42);
INSERT INTO UCZESTNICTWO VALUES (3,47);
INSERT INTO UCZESTNICTWO VALUES (5,8);
INSERT INTO UCZESTNICTWO VALUES (5,15);
INSERT INTO UCZESTNICTWO VALUES (5,25);
INSERT INTO UCZESTNICTWO VALUES (5,32);
INSERT INTO UCZESTNICTWO VALUES (5,36);
INSERT INTO UCZESTNICTWO VALUES (5,43);
INSERT INTO UCZESTNICTWO VALUES (5,46);
INSERT INTO UCZESTNICTWO VALUES (5,33);
INSERT INTO UCZESTNICTWO VALUES (5,6);
INSERT INTO UCZESTNICTWO VALUES (5,11);
INSERT INTO UCZESTNICTWO VALUES (5,16);
INSERT INTO UCZESTNICTWO VALUES (5,18);
INSERT INTO UCZESTNICTWO VALUES (5,30);
INSERT INTO UCZESTNICTWO VALUES (5,31);
INSERT INTO UCZESTNICTWO VALUES (5,34);
INSERT INTO UCZESTNICTWO VALUES (4,8);
INSERT INTO UCZESTNICTWO VALUES (4,15);
INSERT INTO UCZESTNICTWO VALUES (4,25);
INSERT INTO UCZESTNICTWO VALUES (4,32);
INSERT INTO UCZESTNICTWO VALUES (4,36);
INSERT INTO UCZESTNICTWO VALUES (4,43);
INSERT INTO UCZESTNICTWO VALUES (5,35);
INSERT INTO UCZESTNICTWO VALUES (5,37);
INSERT INTO UCZESTNICTWO VALUES (5,40);
INSERT INTO UCZESTNICTWO VALUES (5,49);
INSERT INTO UCZESTNICTWO VALUES (5,51);
INSERT INTO UCZESTNICTWO VALUES (4,46);
INSERT INTO UCZESTNICTWO VALUES (4,33);
INSERT INTO UCZESTNICTWO VALUES (6,2);
INSERT INTO UCZESTNICTWO VALUES (6,29);
-- ZATWIERDZENIE ZMIAN
COMMIT;
SET SERVEROUTPUT ON;
DECLARE
z_imie Varchar2(15):='JAN';
z_nazwisko Varchar2(45):='NOWAK';
BEGIN
DBMS_OUTPUT.put_line('Osoba: '||Initcap(z_imie)||' '||Initcap(z_nazwisko));
END;
/

BEGIN
DBMS_OUTPUT.put_line('Dzi�: ' || to_char(SYSDATE,'dd fmmonth yyyy'));
END;
/

BEGIN
DBMS_OUTPUT.put_line(user);
END;
/

DECLARE 
z_1 int := 10;
z_2 int :=20;
suma int :=z_1+z_2;

BEGIN
DBMS_OUTPUT.put_line('suma: '||suma);
END;
/

DECLARE 
z_1 int := 10;
z_2 int :=20;

BEGIN
DBMS_OUTPUT.put_line('suma: '||(z_1+z_2));
END;
/

DECLARE 
z_pensja pracownicy.pensja%type;
BEGIN
Select MAX(pracownicy.pensja)
into z_pensja
from pracownicy;
DBMS_OUTPUT.put_line(z_pensja);
END;
/
DECLARE 
k number ;
m number ;
BEGIN
SELECT COUNT(pracownicy.plec)
INTO k
From pracownicy
WHERE pracownicy.plec = 'K';
DBMS_OUTPUT.put_line('Kobiety: '||k);
SELECT COUNT(pracownicy.plec)
INTO m
From pracownicy
WHERE pracownicy.plec = 'M';
DBMS_OUTPUT.put_line('Mezczyzna: '||m);

END;
/

DECLARE 
z_p pracownicy.id_pracownika%type:=1;
z_i pracownicy.imie%type;
z_n pracownicy.nazwisko%type;
z_z pracownicy.pensja%type ;
BEGIN
SELECT pracownicy.id_pracownika,pracownicy.imie,pracownicy.nazwisko,(12*(pracownicy.pensja)+pracownicy.dodatek)
INTO z_p,z_i,z_n,z_z
FROM pracownicy;
DBMS_OUTPUT.put_line(z_i || z_n || z_z);
END;
/




