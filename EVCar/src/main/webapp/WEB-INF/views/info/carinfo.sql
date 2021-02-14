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


SELECT (RANK() OVER(ORDER BY count)) ROWNUMs, * FROM carinfo;

select * from (SELECT rownum, * FROM (select * from carinfo ORDER BY count DESC)) WHERE rownum<=6; 

SELECT * FROM (SELECT * FROM carinfo ORDER BY highprice DESC) WHERE rownum<=6; 

SELECT * FROM (SELECT * , ROW_NUMBER() over (order by count) r FROM carinfo) WHERE r <= 6;

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
select * from carinfo;
--drop sequence seq_carinfo;
--drop table carinfo;
select * 
from ALL_TAB_COLUMNS
where TABLE_NAME = 'carinfo' ;
	
 SELECT A.TABLE_NAME
         , (SELECT COMMENTS FROM ALL_TAB_COMMENTS X WHERE X.TABLE_NAME = A.TABLE_NAME AND X.OWNER = A.OWNER) AS TABLE_COMMENT
         , COLUMN_ID
         , A.COLUMN_NAME
         , A.DATA_TYPE ||
           CASE WHEN DATA_TYPE IN ('CHAR','NVARCHAR2','VARCHAR2') THEN '('||CHAR_LENGTH||' '||DECODE(CHAR_USED,'B','BYTE','CHAR')||')'
           WHEN DATA_TYPE IN ('NUMBER','NUMERIC') THEN '('||NVL2(DATA_PRECISION,DATA_PRECISION,DATA_LENGTH)||', '||NVL(DATA_SCALE,'0')||')' END AS DATA_TYPE
         , (SELECT POSITION FROM ALL_CONSTRAINTS X, ALL_CONS_COLUMNS Y WHERE X.CONSTRAINT_TYPE = 'P' AND X.CONSTRAINT_NAME = Y.CONSTRAINT_NAME AND X.TABLE_NAME = A.TABLE_NAME AND X.OWNER = A.OWNER AND Y.COLUMN_NAME = A.COLUMN_NAME) AS Primary_key
         , DECODE(A.NULLABLE,'Y','NULL','NOT NULL') AS NULLABLE
         , DATA_DEFAULT
         , (SELECT COMMENTS FROM ALL_COL_COMMENTS X WHERE X.TABLE_NAME = A.TABLE_NAME AND X.COLUMN_NAME = A.COLUMN_NAME AND X.OWNER = A.OWNER) AS COLUMN_COMMENT
    FROM ALL_TAB_COLUMNS A, ALL_COL_COMMENTS B
   WHERE A.TABLE_NAME = B.TABLE_NAME
     AND A.COLUMN_NAME = B.COLUMN_NAME
     AND A.TABLE_NAME = 'carinfo' -- 테이블명
ORDER BY A.TABLE_NAME, A.COLUMN_ID;





SELECT * FROM USER_SEQUENCES;
--샘플데이터

insert into carinfo (bno,brand,carname,carname_en,cartype,
rowprice,highprice,Support,releasedate,fuel,mileage,chargetype,title,content) values 
(seq_carinfo.nextval,'현대','코나 일렉트릭','KONA Electric','소형차',46900000,48900000,8000000,2020,5.6,406,'DC콤보',
'모빌리티 라이프의 즐거움','한 번 충전으로...');


update carinfo set CARNAME = '푸조 E-208' where bno=35;

select *
		from (select /*+INDEX_DESC(carinfo pk_carinfo) */
			rownum rn, bno, brand, carname, rowprice, highprice, mileage
			from carinfo where brand = '현대' and rownum <= ( 1 * 6))
		where rn>(1-1)*6;



select *
		from (select /*+INDEX_DESC(carinfo pk_carinfo) */
			rownum rn, bno, brand, carname, rowprice, highprice, mileage
			from carinfo where brand = '현대' and type='소형' and rownum <= ( 1 * 6))
		where rn>(1-1)*6;


alter table carinfo modify (review1 nvarchar2(1000));

ALTER TABLE carinfo add (count number(10) default 0);

alter table carinfo modify (carpicture3 nvarchar2(50));



update CARINFO set youtubeurl = 'https://www.youtube.com/embed/gH6O9AnUTA0' where youtubeurl = 'https://youtu.be/gH6O9AnUTA0';

select *from (select
            rownum rn, bno, brand, carname, mileage, thumbnail,
            from carinfo where
            rownum <= (#{cri.pageNum}*#{cri.amount}))
        where rn>(#{cri.pageNum}-1)*#{cri.amount};
        
        
        
 SELECT * FROM (SELECT rownum rn , bno, FROM (select * from carinfo ORDER BY count DESC)) WHERE rownum <= 6; 
       
    SELECT * FROM (SELECT rownum rn ,count,bno,brand,cartype,carname,fuel,releasedate,thumbnail FROM (select * from carinfo ORDER BY count DESC)) WHERE rn <= 6; 

