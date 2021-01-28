<<<<<<< HEAD
create sequence seq_board;

create table notice_board (
	bno NUMBER(10,0),
	title VARCHAR2(100) not null,
	writer VARCHAR2(30) not null,
	regDate DATE default sysdate,
	updateDate DATE default sysdate,
	readCnt NUMBER(10,0)
);
	
alter table notice_board add constraint pk_board primary key(bno);

--더미값
