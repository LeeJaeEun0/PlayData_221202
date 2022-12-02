 -- 위치 조절 늘 확인하기, 되도록 건들일 일 있으면 백업하기!
use sqldb;

# delete를 위한 테이블 복사하기
create table buytbl2 (select * from buytbl); # 서브쿼리를 이용해 새로 만든 테이블에 넣음. new table에 old table 모든 내용 옮김, 원래있던 테이블도 그대로 유지

# delete 
# delete from 테이블이름 whrer 조건;
select * from buytbl2;
delete from buytbl2 where groupName = '전자'; -- 그룹네임이 전자인 사람이 삭제
select * from buytbl2;

delete from buytbl2;  -- 내용 전체 삭제
delete from buytbl2 limit 5; -- limit 숫자만큼 삭제됨!! 주의