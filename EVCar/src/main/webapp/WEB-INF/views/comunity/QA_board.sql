select * from QA_BOARD;

create table QA_board (
	bno
	title
	writer
	content
	password
	regDate
	updateDate
	readCnt
);

alter table QA_board add constraint pk2_board primary key(bno);
alter table QA_board modify (content varchar2(1000)) ;
select * from QA_board;

-- 댓글
drop sequence QAseq_reply;


create table QA_reply(
	rno number(10,0),
	bno number(10,0) not null,
	reply varchar2(1000) not null,
	replyer varchar2(50) not null,
	replyDate date default sysdate,
	updateDate date default sysdate
);

create sequence QAseq_reply;

alter table QA_reply add constraint QApk_reply primary key (rno);

alter table QA_reply add constraint QAfk_reply foreign key(bno) references QA_board (bno);

select * from QA_board;
select * from QA_reply;

ALTER TABLE QA_board ADD replyCnt number(10,0) default 0;

update QA_board set replyCnt = (select count(rno) from QA_reply where QA_board.bno=QA_reply.bno);