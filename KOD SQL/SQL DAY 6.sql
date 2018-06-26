use baza_1
select * from osoba


alter database baza_1 add file(
NAME= 'baza_1_add_file_help',
filename = 'E:\zbazy\baza_1_add_help.ndf',
SIZE= 5120KB,
FILEGROWTH = 1024KB)

select * from osoba

insert into osoba values(5,'B','B','M'),(6,'C','C','M')

select * from osoba

declare @rok int;
select @rok= datepart(year,Getdate())
if(@rok = 2017)
	PRINT 'cos nie tak'
else if(@rok = 2018)
		PRINT 'correct' 
	else PRINT 'xd';

select case  datepart(year,Getdate())
when 2017 then 'xd'
when 2018 then 'correct year'
else 'uncorrect year'
end

declare @stala int = 1;
while @stala<10
begin print 'xd'
set @stala = @stala+1
end

backup database baza_1 to disk ='E:\zbazy\backup_baza1_fill.bak' ;

insert into osoba values(7,'B','B','M'),(8,'C','C','M')

backup database baza_1 to disk = 'E:\zbazy\backup_baza1_fill_2.bak'  with differential;

insert into osoba values(9,'B','B','M'),(10,'C','C','M')

backup database baza_1 to disk = 'E:\zbazy\backup_baza1_fill_3.bak'  with differential;

backup log baza_1 to disk ='E:\zbazy\backup_baza1_log.bak' with continue_after_error

restore log baza_1 from disk = '' with recovery;

restore log baza_1 from disk='' with stopat='2018-01-19 11:30:00.000' wit

