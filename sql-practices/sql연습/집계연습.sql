-- 집계쿼리: select 그룹함수가 적용된 경우
select avg(salary)
  from salaries;
  
-- select 절에 그룹 함수가 있는 경우, 어떤 컬럼도 select절에 올 수 없다.
-- emp_no는 아무 의미가 없다.
-- 오류!!!!! 
select emp_no, avg(salary)
from salaries;
  
-- query 실행 순서alter
-- (1) from: 접근 데이블 확인
-- (2) where: 조건에 맞는 row 선택
-- (3) 집계
-- (4) projection
select avg(salary)
from salaries
where emp_no='10060';

-- group by 에 참여하고 있는 컬럼은 projection이 가능하다(select 절에 올 수 있다)
select emp_no as '사원번호',avg(salary)
from salaries
group by emp_no
order by avg(salary);

-- having
-- 집계결과(결과 임시 테이블) row를 선택해야 하는 경우
-- 이미 where절은 실행이 되었기 때문에 having절에서 조건을 주어야 한다. 
select emp_no, avg(salary) as '급여평균'
from salaries
group by emp_no
having avg(salary) < 60000
order by 급여평균 desc;

-- 예제
-- salaries 테이블에서 사번이 10060인 직원의 급여 평균과 총합을 출력
-- 문법적으로 오류
-- 의미적으로 맞다(where)
select avg(salary), sum(salary)
from salaries
where emp_no='10060';









