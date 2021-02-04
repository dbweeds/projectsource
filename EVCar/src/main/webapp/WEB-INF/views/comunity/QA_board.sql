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