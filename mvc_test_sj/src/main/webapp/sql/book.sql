-- 도서 관리 테이블
create table book2 (
    serial varchar2(30) primary key,  -- 도서코드
    title varchar2(30) not null,    -- 도서명
    writer varchar2(30) not null,   -- 저자
    publisher varchar2(30),         -- 출판사
    cost number,                    -- 가격
    p_date varchar2(30)             -- 출판일
);
-- 테이블 구조 확인
desc book2;
-- 테이블 삭제
drop table book2 purge;
-- 테이블 목록
select * from tab;

-- 1) 데이터 추가
insert into book2 values ('101000', '웹 프로그래밍 독파', '최범균', '가메출판사', 30000, '2020-01-05');
insert into book2 values ('101001', '자바 프로그래밍', '김정현', '남가람북스', 25000, '2019-01-05');
insert into book2 values ('101005', '자바기술', '최범균', '길벗', 30000, '2020-03-05');
insert into book2 values ('120104', '웹 개발서', '김계회', '한빛출판사', 25000, '2020-05-05');
insert into book2 values ('101015', '웹프로그래밍1', '이범승', '한빛출판사', 30000, '2020-10-05');
insert into book2 values ('321016', '웹프로그래밍2', '이태환', '길벗', 30000, '2021-01-05');
insert into book2 values ('101200', '실무 웹', '장현승', '가메출판사', 30000, '2020-01-05');
insert into book2 values ('321820', '기초부터 중급까지', '오주현', '길벗', 25000, '2020-01-05');
insert into book2 values ('101000', '웹 기술', '최범균', '남가람북스', 30000, '2021-01-05');
insert into book2 values ('549600', '생활코딩', '이고잉', '길벗', 23000, '2020-01-05');
insert into book2 values ('108720', '한권으로 끝', '최태현', '한빛출판사', 30000, '2020-01-05');
insert into book2 values ('128900', '스프링', '김정현', '한빛출판사', 19000, '2021-01-05');
insert into book2 values ('172000', 'JSP', '최범균', '길벗', 30000, '2021-01-05');
    
-- 2) 데이터 검색
select * from book2;

select * from book2 where serial='101000';

select * from
(select rownum rn, tt.* from 
(select * from book2 order by serial asc) tt)
where rn>=1 and rn<=5;

-- 3) 데이터 수정

-- 4) 데이터 삭제

-- 5) DB 저장
commit;