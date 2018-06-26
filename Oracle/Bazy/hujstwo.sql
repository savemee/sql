drop table osoby;
CREATE TABLE OSOBY(
id NUMBER (3) NOT NULL CONSTRAINT id_pk PRIMARY KEY ,
pierwsze_imie VARCHAR2 (15) CHECK(Initcap(pierwsze_imie)=pierwsze_imie)NOT NULL,
drugie_imie VARCHAR2 (15) CHECK(Initcap(drugie_imie)=drugie_imie),
nazwisko VARCHAR2 (20)CHECK(Initcap(nazwisko)=nazwisko) NOT NULL,
nazwisko_panienskie   VARCHAR2 (20) CHECK(Initcap(nazwisko_panienskie)=nazwisko_panienskie),
plec CHAR (1) NOT NULL CHECK(plec='K' OR plec='M'),
data_urodzenia DATE DEFAULT SYSDATE NOT NULL,
miejsce_urodzenia VARCHAR2 (20) NOT NULL,
data_smierci DATE ,
data_wpisu_do_bazy DATE NOT NULL,
id_ojca NUMBER (3),
id_matki NUMBER (3),
CONSTRAINT id_ojca_fk FOREIGN KEY (id_ojca) REFERENCES OSOBY(id),
CONSTRAINT id_matki_fk FOREIGN KEY (id_matki) REFERENCES OSOBY(id),
CONSTRAINT data_check CHECK(data_smierci>=data_urodzenia)
);
drop table Zwiazki;
CREATE TABLE ZWIAZKI(
data_zawarcia  DATE NOT NULL,
data_rozwiazania DATE ,
id_meza NUMBER (3) NOT NULL,
id_zony NUMBER (3) NOT NULL,
CONSTRAINT data_zaw_check CHECK(data_rozwiazania>=data_zawarcia),
CONSTRAINT zwiazki_pk PRIMARY KEY (id_meza,id_zony,data_zawarcia)
);

CREATE INDEX osoby_index ON osoby(nazwisko,pierwsze_imie);

DROP SEQUENCE osoby_seq;
CREATE SEQUENCE osoby_seq 
INCREMENT BY 1
START WITH 1;


INSERT INTO osoby VALUES 
(osoby_seq.NEXTVAL, 'Jan', NULL, 'Nowak', NULL, 'M', TO_DATE('18.04.1918',
'DD.MM.YYYY'), '£ódŸ', TO_DATE('20.05.1990', 'DD.MM.YYYY'), SYSDATE, NULL,
NULL);
INSERT INTO osoby VALUES
(osoby_seq.NEXTVAL, 'Anna', NULL,'Nowak', 'Kowalska', 'K',
TO_DATE('17.09.1925', 'DD.MM.YYYY'), 'Zgierz', TO_DATE('21.06.1970',
'DD.MM.YYYY'), SYSDATE, NULL, NULL);
INSERT INTO zwiazki VALUES 
(TO_DATE('15.05.1946', 'DD.MM.YYYY'), NULL, 
(SELECT id FROM osoby WHERE pierwsze_imie='Jan' AND nazwisko='Nowak' AND
data_urodzenia=TO_DATE('18.04.1918', 'DD.MM.YYYY')),
(SELECT id FROM osoby WHERE pierwsze_imie='Anna' AND nazwisko='Nowak' AND
data_urodzenia=TO_DATE('17.09.1925', 'DD.MM.YYYY')) 
);
INSERT INTO osoby VALUES 
(osoby_seq.NEXTVAL, 'Tomasz', 'Adam' ,'Nowak', NULL, 'M',
TO_DATE('26.10.1948', 'DD.MM.YYYY'), 'Zgierz',  NULL, SYSDATE, 
(SELECT id FROM osoby WHERE pierwsze_imie='Jan' AND nazwisko='Nowak' AND
data_urodzenia=TO_DATE('18.04.1918', 'DD.MM.YYYY')),
(SELECT id FROM osoby WHERE pierwsze_imie='Anna' AND nazwisko='Nowak'AND
data_urodzenia=TO_DATE('17.09.1925', 'DD.MM.YYYY')));
INSERT INTO osoby VALUES
(osoby_seq.NEXTVAL, 'Maria', 'Anna' ,'Jastrzêbska', 'Nowak', 'K',
TO_DATE('25.01.1951', 'DD.MM.YYYY'), 'Zgierz', NULL, SYSDATE, 
(SELECT id FROM osoby WHERE pierwsze_imie='Jan' AND nazwisko='Nowak' AND
data_urodzenia=TO_DATE('18.04.1918', 'DD.MM.YYYY')),
(SELECT id FROM osoby WHERE pierwsze_imie='Anna' AND nazwisko='Nowak' AND
data_urodzenia=TO_DATE('17.09.1925', 'DD.MM.YYYY'))
); 
INSERT INTO osoby VALUES
(osoby_seq.NEXTVAL,'Maciej','Witold','Jastrzêbski',NULL,'M',
TO_DATE('24.12.1950', 'DD.MM.YYYY'),'£ódz',TO_DATE('14.11.1980', 'DD.MM.YYYY'), SYSDATE, NULL, NULL
);
INSERT INTO osoby VALUES
(osoby_seq.NEXTVAL,'Ewa','Agata','Jastrzêbska',NULL,'K',
TO_DATE('15.11.1977', 'DD.MM.YYYY'),'Warszawa',NULL, SYSDATE, (SELECT id FROM osoby WHERE  pierwsze_imie='Maria'AND nazwisko='Jastrzêbska'AND  
data_urodzenia=TO_DATE('25.01.1951', 'DD.MM.YYYY')), (SELECT id FROM osoby WHERE  pierwsze_imie='Maciej'AND nazwisko='Jastrzêbski'AND 
data_urodzenia=TO_DATE('24.12.1950', 'DD.MM.YYYY'))
);
INSERT INTO osoby VALUES
(osoby_seq.NEXTVAL,'Wojciech','Pawel','Jastrzêbski',NULL,'M',
TO_DATE('17.02.1974', 'DD.MM.YYYY'),'Warszawa',NULL, SYSDATE, (SELECT id FROM osoby WHERE  pierwsze_imie='Maria'AND nazwisko='Jastrzêbska'AND  
data_urodzenia=TO_DATE('25.01.1951', 'DD.MM.YYYY')), (SELECT id FROM osoby WHERE  pierwsze_imie='Maciej'AND nazwisko='Jastrzêbski'AND 
data_urodzenia=TO_DATE('24.12.1950', 'DD.MM.YYYY')));



create or replace view v_zmarli AS
select pierwsze_imie,Nazwisko from osoby where data_smierci is not null;
select * from user_views;

create or replace view v_osoby AS
select pierwsze_imie||''||nazwisko,plec 
from osoby;
