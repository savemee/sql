--1. Create a table called Student and insert some data
create table Student(
studId int identity, 
lName varchar(40),
fName varchar(40))

insert into Student values('John','Smith')
insert into Student values('Mark','Noris')

select * from Student

--2. Create a full backup (this full backup will contain 2 students)
backup database demoDB
to disk='c:\backup\full_backup.bak'

--3. Insert two new students and perform differential backup

insert into Student values('Emily','Plater')
insert into Student values('Eva','Trace')

backup database demoDB
to disk='c:\backup\diff_backup.bak'
with differential

select * from Student

--3. Add next student and perform log backup

insert into Student values('Martin','Holly')

backup log demoDB
to disk='c:\backup\log_backup.bak'

--4. Add next student and delete the data file

insert into Student values('Michael','Sonn')

--Michael is not in any backup file



--1 and 2 are in full backup
--3 and 4 are in differential backup
-- 5 is in log backup
-- Michael is in the log file

--Try to perform a log baclup (it is called tail-log backup)
backup log demoDB
to disk='c:\backup\tail_log_backup.bak'
with continue_after_error


--We can restore our database to the point of failure

--a) We restore the full backup
restore database demoDB
from disk='c:\backup\full_backup.bak'
with norecovery

--b) We restore the differential backup
restore database demoDB
from disk='c:\backup\diff_backup.bak'
with norecovery


--c) We restore the log backup
restore database demoDB
from disk='c:\backup\log_backup.bak'
with norecovery

--d) We restore the tail log backup
restore database demoDB
from disk='c:\backup\tail_log_backup.bak'
with recovery


select * from Student


