# insert문
use sqldb;
create table testTbl1
(
	id int,
    userName char(3),
    age int
);

# insert 하기
insert into testTbl1 values(1,'홍길동',25);
select * from testtbl1;

# 전체 열 중에 일부의 값만 insert 가능
insert into testTbl1(id, userName) values(2,'설현');
select * from testtbl1;

# 순서 바꿔서 insert 가능
insert into testTbl1(userName, age, id) values('하니', 26, 3);
select * from testtbl1; 

delete from testtbl1 where id=2 limit 1;  -- limit옵션도 사용가능

create table testTbl2
(
	id int auto_increment primary key, # auto_increment는 1부터 순서대로 넣을 수 있다.
    userName char(3),
    age int
);
insert into testtbl2 values(null,'지민',25);
insert into testtbl2 values(null,'유나',23);
insert into testtbl2 values(null,'유경',21);
select * from testtbl2;

# 카테고리별로 구분된 id를 주고 싶을때, 과일은 1000번부터 시작, 옷은 2000번 부터 시작 처럼 # 중요한 개념
alter table testtbl2 auto_increment = 100;
insert into testtbl2 values(null,'찬미',23);
select * from testtbl2;

# @@auto_increment_increment를 하면 원하는 숫자만큼 증가할 수 있다
alter table testtbl2 auto_increment = 1000;
set @@auto_increment_increment=3;
insert into testtbl2 values(null,'나연',20); -- 1000
insert into testtbl2 values(null,'정연',18); -- 1003
insert into testtbl2 values(null,'모모',23); -- 1006
select * from testtbl2;

#대용량 복사
use sqldb;
create table testtbl4 
(
	id int,
    Fname varchar(50),
    Lname varchar(50)
);
# db: employees, table: employees의 내용을 testtnl4에 붙여 넣기 - 300024개 만큼 들어감
insert into testtbl4
select emp_no, first_name, last_name
from employees.employees;

# insert - ignore
use sqldb;
create table membertabl -- 회원 테이블
(
	userID CHAR(8) NOT NULL primary KEY, -- 사용자ID(PK)
    name VARCHAR(10) NOT NULL, -- 이름
    addr CHAR(2) NOT NULL -- 지역(경기, 서울, 경남 식)
);

INSERT INTO membertabl VALUES('LSG','이승기','서울');
INSERT INTO membertabl VALUES('KBS','감범수','경남');
INSERT INTO membertabl VALUES('KKH','김경호','전남');
INSERT INTO membertabl VALUES('JYP','조용필','경기');
INSERT INTO membertabl VALUES('SSK','성시경','서울');
INSERT INTO membertabl VALUES('LJB','임재범','서울');
INSERT INTO membertabl VALUES('YJS','윤종신','경남');
INSERT INTO membertabl VALUES('EJW','은지원','경북');
INSERT INTO membertabl VALUES('JKW','조관우','경기');
INSERT INTO membertabl VALUES('BBK','바비킴','서울');

# insert - ignore속성은 이미 있는 값은 경고 표시만 보이고 들어가지 않음.   
insert ignore into membertabl values('SJH','서장훈','서울');
insert ignore into membertabl values('HJY2','현주엽','경기1');
insert ignore into membertabl values('HJY3','현주엽','경기2');

select * from membertabl where fname='현주엽'; 