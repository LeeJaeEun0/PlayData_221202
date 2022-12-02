# 복습하기 - 서브쿼리
# 김경호의 키보다 큰 사람을 찾고 싶을때
# 먼저 김경호의 키를 서브 쿼리로 찾아서 where 조건 비교하기
use sqldb;
select name, height 
from usertbl
where height > (select height from usertbl where name = '김경호');

# 지역이 경남 사람이 여러명이니까 오류 발생 - 어떤 값과 비교해야할지 모름!!!!!
select name, height 
from usertbl
where height > (select height from usertbl where addr = '경남');

# 경남 사람이 여러명 일때 -ANY 사용
#  170보다 같거나 크거나 173보다 같거나 크면 = OR임으로 170보다 크면 OK 
select name, height 
from usertbl
where height >= ANY(select height from usertbl where addr = '경남'); 

# 경남 사람이 여러명 일때 - ALL 사용
#  170보다 같거나 크고 173보다 같거나 크면 = AND임으로 173보다 커야만 가능! 
select name, height 
from usertbl
where height >= ALL(select height from usertbl where addr = '경남');  

# 경남 사람이 여러명 일때 -ANY 사용 
#170와 같거나 173과 같으면 = OR임으로 둘 중에 하나만 맞으면 OK 
select name, height 
from usertbl
where height = ANY(select height from usertbl where addr = '경남'); # 170, 173

# 경남 사람이 여러명 일때 - ALL 사용
#170와 같고 173과 같으면 = AND임으로 두조건을 만족시킨 데이터가 있어야하는데.... 없다..... 
select name, height 
from usertbl
where height = ALL(select height from usertbl where addr = '경남');

# rollup 사용하기
# groupname을 이용해서 계산산 결과를 중간값으로
select num, groupName, sum(price*amount)
from buytbl
group by groupName, num
with rollup;