create or replace package body pakiet1 IS
procedure update_kurs(
p_nazwa in KURSY.nazwa%Type,
pp_nazwa in KURSY.nazwa%Type)
AS
p_id_kursu KURSY.ID_KURSU%Type;
BEGIN

select id_kursu  into p_id_kursu from KURSY where NAZWA = p_nazwa;
update kursy set KURSY.nazwa= pp_nazwa where p_id_kursu = kursy.ID_KURSU;
END;
end;

EXECUTE PAKIET1.UPDATE_KURS('ala','xd');