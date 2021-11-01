-- 익명게시판
create table board2 (
    board_num number,                       -- 글 번호
    board_name varchar2(30) not null,       -- 글 작성자
    board_pass varchar2(30) not null,       -- 글 비밀번호
    board_subject varchar2(250) not null,   -- 글 제목
    board_content varchar2(4000) not null,  -- 글 내용
    board_file varchar2(50) not null,       -- 첨부 파일
    board_re_ref number not null,           -- 관련글 번호
    board_re_lev number not null,           -- 답글 레벨
    board_re_seq number not null,           -- 관련글중 출력순서
    board_readcount number default 0,       -- 조회수
    board_date date,                        -- 작성일
    primary key(board_num)
);

-- 테이블 삭제
drop table board2 purge;
-- 테이블 확인
select * from tab;

-- 시퀀스 생성
create sequence seq_num nocycle nocache;
-- 시퀀스 삭제
drop sequence seq_num;

-- 데이터 저장
insert into board2 values
(seq_num.nextval, '홍길동', '1234', '내일은', '웃으리...', 'aa.jpg',
seq_num.currval, 0, 0, 0, sysdate);

insert into board2 values
(seq_num.nextval, '홍길동', '1234', '내일은', '웃으리...', 'aa.jpg',
seq_num.currval, 0, 0, 0, sysdate);

-- 데이터 검색
select * from board2;
select * from board2 where board_num = 1;
-- 전체 데이터 갯수 확인
select count(*) as cnt from board2;

-- 데이터 삭제
delete board2 where board_num = 1;

-- db 저장
commit;