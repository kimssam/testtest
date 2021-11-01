-- 회원 관리 테이블
create table member (
    name varchar2(30) not null,     -- 이름
    id varchar2(30) primary key,    -- 아이디, unique, not null
    pwd varchar2(30) not null,      -- 비밀번호
    gender varchar2(5),             -- 성별
    email1 varchar2(20),            -- 이메일 앞부분
    email2 varchar2(20),            -- 이메일 뒷부분
    tel1 varchar2(10),              -- 전화번호 앞
    tel2 varchar2(10),              -- 전화번호 중간
    tel3 varchar2(10),              -- 전화번호 뒤
    addr varchar2(100),             -- 주소
    logtime date                    -- 가입 날짜
);
-- 테이블 구조 확인
desc member;
-- 테이블 삭제
drop table member purge;
-- 테이블 목록
select * from tab;

-- 1) 데이터 추가
insert into member values ('홍길동', 'hong', '1234', '남', 'hong', 'naver.com',
    '010', '1234', '5678', '경기도 수원시', sysdate);
    
-- 2) 데이터 검색
select * from member;
select * from member where id='hong';
select * from member where id='hong' and pwd='1234';

-- 3) 데이터 수정
update member set tel2='5555' where id='hong';

-- 4) 데이터 삭제
delete member where id='hong';

-- 5) DB 저장
commit;
