
create table admin(
	adminId varchar2(20) primary key,
	adminPassword varchar2(20) not null
);
insert into admin values('admin','admin12345');

select * from admin;