

--기본테이블
create table carinfo(
		bno number primary key,
		brand VARCHAR2(30) not null,	   --브랜드
		carname VARCHAR2(30) not null,	   --차명
		carname_en VARCHAR2(30) not null,  --차명영어
		cartype VARCHAR2(30) not null,	   --종류
		rowprice number(10,2) not null,	   --최저가
		highprice number(10,2) not null,   --최고가
		support number(10,2) not null,     --보조금
		releasedate number(10,2) not null, --출시일
		fuel number(10,2) not null,        --연비 km/kWh
		mileage number(10,2) not null,     --주행가능거리 km
		chargetype VARCHAR2(30) not null,  --급속충전타입 dc콤보(공통) / 유럽형(테슬라만)
		title VARCHAR2(100) , 	   		   --타이틀
		content VARCHAR2(800)	           --내용,제원
);

create sequence carinfo_seq;

drop sequence carinfo_seq;
drop table carinfo;

select * from carinfo;
delete from CARINFO where bno between 2 and 20;
--샘플데이터
insert into carinfo (bno,brand,carname,carname_en,cartype,
rowprice,highprice,Support,releasedate,fuel,mileage,chargetype, title,content) values 
(carinfo_seq.nextval,'현대','코나 일렉트릭','KONA Electric','소형차',46900000,48900000,8000000,2020,5.6,406,'DC콤보',
'모빌리티 라이프의 즐거움','한 번 충전으로...');

--update carinfo set rowprice = 39950000, highprice = 43950000 where bno=6;
update carinfo set carname = '푸조 E-2008' where bno=19;


alter table carinfo modify rowprice number(15,3);
alter table carinfo modify highprice number(15,3);







