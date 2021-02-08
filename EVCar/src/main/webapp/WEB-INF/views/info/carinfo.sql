--목록 페이지 나누기
select rownum, bno, brand,carname,mileage from carinfo where rownum <= 6;

--최신글 6개 나열
select rownum, bno, brand, carname, mileage
from (select bno, carname, brand, mileage from carinfo order by bno desc)
where rownum <=6;


select /*+INDEX_DESC(carinfo pk_carinfo) */rownum, bno, brand, carname, mileage
from carinfo
where rownum <=6;

--1페이지 최신글
select rn,bno, brand, carname, mileage
from (select rownum rn, bno, brand, carname, mileage
from (select bno, carname, brand, mileage from carinfo order by bno desc)
where rownum <=6)
where rn>0;

select rn,bno, brand, carname, mileage
from (select /*+INDEX_DESC(carinfo pk_carinfo) */rownum rn, bno, brand, carname, mileage
from carinfo where rownum <=6)
where rn>0;


--2페이지 최신글
select rn, bno, brand, carname, mileage
from (select rownum rn, bno, brand, carname, mileage
from (select bno, carname, brand, mileage from carinfo order by bno desc)
where rownum <=12)
where rn>6;

select rn,bno, brand, carname, mileage
from (select /*+INDEX_DESC(carinfo pk_carinfo) */rownum rn, bno, brand, carname, mileage
from carinfo where rownum <=12)
where rn>6;


--페이지 번호 넘어오는경우 완성
-- 1페이지 => 6, 0
-- 2페이지 => 12, 6
select *
from (select /*+INDEX_DESC(carinfo pk_carinfo) */
	rownum rn, bno, brand, carname, rowprice, highprice, mileage
	from carinfo where rownum <=?)
where rn>?;




--검색

select *
from (select /*+INDEX_DESC(carinfo pk_carinfo) */
	rownum rn, bno, brand, carname, rowprice, highprice,cartype , chargetype,mileage
	from carinfo where brand like '%현대%' and rownum<=10)
where rn>0;


select *
from (select /*+INDEX_DESC(carinfo pk_carinfo) */
	rownum rn, bno, brand, carname, rowprice, highprice,cartype , chargetype,mileage
	from carinfo where brand like '%현대%' or chargetype like '%DC콤보%' and rownum<=10)
where rn>0;


select *
from (select /*+INDEX_DESC(carinfo pk_carinfo) */
	rownum rn, bno, brand, carname, rowprice, highprice,cartype , chargetype,mileage
	from carinfo where brand like '%현대%' and cartype like '%중형차%' and chargetype like '%DC콤보%' and rownum<=10)
where rn>0;







--기본테이블
create table carinfo(
		bno number(10,0),
		brand VARCHAR2(30) not null,	   --브랜드
		carname VARCHAR2(30) not null,	   --차명
		carname_en VARCHAR2(30) not null,  --차명영어
		cartype VARCHAR2(30) not null,	   --종류
		rowprice number(15,3) not null,	   --최저가
		highprice number(15,3) not null,   --최고가
		support number(10,2),     		   --보조금
		releasedate number(10,2) not null, --출시일
		fuel number(10,2) not null,        --연비 km/kWh
		mileage number(10,2) not null,     --주행가능거리 km
		chargetype VARCHAR2(30) not null,  --급속충전타입 dc콤보(공통) / ac3상 유럽형(테슬라만)
		title VARCHAR2(100), 	   		   --타이틀
		content VARCHAR2(800)	           --내용,제원
);

ALTER TABLE carinfo add constraint pk_carinfo primary key(bno);

create sequence seq_carinfo;

select * from carinfo order by bno desc;

--drop sequence seq_carinfo;
--drop table carinfo;

	
SELECT * FROM USER_SEQUENCES;




--샘플데이터

insert into carinfo (bno,brand,carname,carname_en,cartype,
rowprice,highprice,Support,releasedate,fuel,mileage,chargetype,title,content) values 
(seq_carinfo.nextval,'현대','코나 일렉트릭','KONA Electric','소형차',46900000,48900000,8000000,2020,5.6,406,'DC콤보',
'모빌리티 라이프의 즐거움','한 번 충전으로...');


update carinfo set CARNAME = '푸조 E-208' where bno=35;










