declare 
liczba1 integer := 10;
liczba2 integer :=20;
liczba3 integer;
liczba4 real;
BEGIN
liczba3 := liczba1 + liczba2;
liczba4:= liczba1/liczba2 * liczba3**2;
SYS.DBMS_OUTPUT.PUT_LINE('liczba to : '||liczba3);
DBMS_OUTPUT.PUT_LINE('liczba potega :'|| liczba3**2);
DBMS_OUTPUT.PUT_LINE('liczba podzielona :' || liczba4);
END;

declare 
id_kur kursy.id_kursu%type := 1;
nazwa_kursu kursy.nazwa%type;
liczba_godzin_kursu KURSY.LICZBA_GODZIN%type;
begin
select id_kursu,nazwa,liczba_godzin into id_kur,nazwa_kursu,liczba_godzin_kursu
from KURSY
where id_kursu = id_kur;
DBMS_OUTPUT.PUT_LINE(id_kur ||' '||nazwa_kursu||' '||liczba_godzin_kursu);
end;


declare 
id_pracownik number := &id_pracownia;
begin 

DBMS_OUTPUT.PUT_LINE('Praconików: '|| imie_pracownik);
end;

--example
Declare 

type pracownik is record
(
id_pr PRACOWNICY.ID_PRACOWNIKA%Type;
im PRACOWNICY.IMIE%Type;
nazw PRACOWNICY.NAZWISKO%type;
);
pracownik1 pracownik;
begin
pracownik1.idpr := 1;
pracownik1.im := 'Andrzej';
pracownik1.nazw := 'XXX';
insert into pracownicy values pracownik1;
commit;
end;


declare 
p_imie pracownicy.imie%type := 'KRZYSZTOF';
p_nazwisko pracownicy.nazwisko%type := 'KONECKI';
p_zawod pracownicy.zawod%type;
begin 
select imie,nazwisko,zawod
into p_imie,p_nazwisko,p_zawod
from pracownicy
where imie =p_imie AND nazwisko= p_nazwisko;
DBMS_OUTPUT.PUT_LINE('imie: '|| p_imie || ' nazwisko: ' || p_nazwisko ||' zawod: '|| p_zawod);
EXCEPTION
when no_data_found  Then 
SYS.DBMS_OUTPUT.PUT_LINE(' no data found');
when too_many_rows then
SYS.DBMS_OUTPUT.PUT_LINE(' too many rows ');
end;



declare 
p_imie NUMBER := &IMIE;
p_nazwisko NUMBER:= &NAZWISKO;
begin 
DBMS_OUTPUT.PUT_LINE('imie: '|| p_imie || ' nazwisko: ' || p_nazwisko);
EXCEPTION
when no_data_found  Then 
SYS.DBMS_OUTPUT.PUT_LINE(' no data found');
when too_many_rows then
SYS.DBMS_OUTPUT.PUT_LINE(' too many rows ');
end;

DECLARE 
l1 number := &liczba;
begin

if l1 = 0 then SYS.DBMS_OUTPUT.PUT_LINE('zero');
elsif l1 < 10 then SYS.DBMS_OUTPUT.PUT_LINE('small values');
else DBMS_OUTPUT.PUT_LINE('big value');
end if;
end;

DECLARE 
l1 number := &liczba;
begin
CASE l1
when 0 then SYS.DBMS_OUTPUT.PUT_LINE('zero');
WHEN 1 then SYS.DBMS_OUTPUT.PUT_LINE('1');
WHEN 2 then SYS.DBMS_OUTPUT.PUT_LINE('2');
else SYS.DBMS_OUTPUT.PUT_LINE('blad');
end case;
end;

DECLARE 
l1 number := &liczba;
begin
CASE 
when l1=0 then SYS.DBMS_OUTPUT.PUT_LINE('zero');
WHEN l1=1 then SYS.DBMS_OUTPUT.PUT_LINE('1');
WHEN l1>2 then SYS.DBMS_OUTPUT.PUT_LINE('big');
else SYS.DBMS_OUTPUT.PUT_LINE('blad');
end case;
end;




