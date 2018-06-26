DECLARE 
z_zmienna  pracownicy.zawod%TYPE;
CURSOR kursorjawny IS Select DISTINCT(zawod) from pracownicy;
BEGIN
OPEN kursorjawny;
LOOP
FETCH kursorjawny INTO z_zmienna;
EXIT WHEN kursorjawny%NOTFOUND;
DBMS_OUTPUT.put_line('zawod: '||z_zmienna);
END LOOP;
END;
/

DECLARE 
z_imie pracownicy.imie%TYPE;
z_nazwisko pracownicy.nazwisko%TYPE;
CURSOR imienazwisko IS Select Initcap(nazwisko), Initcap(imie) from pracownicy ORDER BY 1 ASC ,2 ASC;
BEGIN
OPEN imienazwisko;
LOOP
FETCH imienazwisko INTO z_nazwisko,z_imie;
EXIT WHEN imienazwisko%NOTFOUND;
DBMS_OUTPUT.put_line('Nazwisko: '||z_nazwisko||' Imie: '||z_imie);
END LOOP;
END;
/

DECLARE 
z_imie pracownicy.imie%TYPE;
z_nazwisko pracownicy.nazwisko%TYPE;
z_zawod pracownicy.zawod%type;
z_nazwa placowki.nazwa%type;
CURSOR imienazwisko IS Select p.Nazwisko,p.Imie,p.zawod,pl.nazwa from pracownicy p join placowki pl on (p.id_placowki=pl.id_placowki) ORDER BY 1 ASC ,2 ASC;
BEGIN
OPEN imienazwisko;
LOOP
FETCH imienazwisko INTO z_nazwisko,z_imie,z_zawod,z_nazwa;
EXIT WHEN imienazwisko%NOTFOUND;
DBMS_OUTPUT.put_line('Nazwisko: '||z_nazwisko||' '||z_imie||' '||z_zawod||' '||z_nazwa);
END LOOP;
END;
/

DECLARE 
z_zawod pracownicy.zawod%type;
z_pensja pracownicy.pensja%type;
CURSOR zawody IS select distinct(zawod) from pracownicy;
CURSOR zawodys IS Select MIN(pensja) pensja_min ,MAX(pensja) pensja_max ,ROUND(AVG(pensja)) pensja_avg,zawod ,count(zawod) zawody_ilosc from pracownicy group by zawod;
BEGIN

FOR zz IN zawodys LOOP

DBMS_OUTPUT.put_line(zz.zawody_ilosc||' '||zz.zawod||' ' || ' '|| zz.pensja_min ||' '||zz.pensja_max|| ' '||zz.pensja_avg);
END LOOP;
END;
/

CREATE or REPLACE FUNCTION LiteraIleOso (p_litera char )
RETURN NUMBER IS
ilosc Number(4);

BEGIN
select count(id_pracownika)into ilosc from pracownicy
Where substr(imie,1,1)=p_litera;
return ilosc;
END;
/




