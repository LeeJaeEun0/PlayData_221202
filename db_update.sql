# update 테이블 이름 set 열1 = 깂1, 열2 = 값2 where 조건;
update buytbl set price = price *1.5;
select * from buytbl; -- 전제적으로 가격이 1.5 증가

update buytbl set price = 30 where prodName='운동화'; -- 운동화 가격만 1.5로 가격 올리기
update buytbl set price = 100, amount = 3 where num = 2;