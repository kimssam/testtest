-- 글 관리 테이블
create table board (
    seq number not null,                -- 글번호
    id varchar2(30) not null,           -- 아이디
    name varchar2(40) not null,         -- 이름
    subject varchar2(255) not null,     -- 제목
    content varchar2(4000) not null,    -- 내용
    hit number default 0,               -- 조회수
    logtime date default sysdate        -- 작성일
);
-- 테이블 구조 확인
desc board;
-- 테이블 삭제
drop table board purge;
-- table 목록
select * from tab;
-- 시퀀스 객체 생성
create sequence seq_board nocache nocycle;
-- 시퀀스 객체 삭제
drop sequence seq_board;

-- 글 데이터 저장
insert into board values
(seq_board.nextval, 'num1', '홍길동', '내일은', '웃으리...', 0, sysdate);

-- 전체 확인
select * from board;
-- 특정 글번호로 확인
select * from board where seq=1;

-- 데이터 삭제
delete board where seq=1;

-- DB 저장
commit;