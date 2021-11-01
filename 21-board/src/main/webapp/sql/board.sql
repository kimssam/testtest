create table board2 (
    board_num number,                       -- 글 번호 
    board_name varchar2(30) not null,       -- 글 작성자 
    board_pass varchar2(30) not null,       -- 글 비밀번호
    board_subject varchar2(250) not null,   -- 글 제목 
    board_content varchar2(4000) not null,  -- 글 내용
    board_file varchar2(50) not null,       -- 첨부 파일
    board_re_ref number not null,           -- 관련 글 번호
    board_re_lev number not null,           -- 답글 레벨
    board_re_seq number not null,           -- 관련 글 중 출력 순서
    board_readcount number default 0,       -- 조회수
    board_date date,                        -- 작성일
    primary key(board_num)
);
-- 테이블 삭제 
drop table board2 purge;

-- 시퀀스 객체 생성
create sequence seq_num nocycle nocache;
-- 시퀀스 삭제
drop sequence seq_num;

-- 데이터 저장
insert into board2 values
(seq_num.nextval, '홍길동', '1234', '내일은', '웃으리...', 'aa.jpg',
seq_num.currval, 0, 0, 0, sysdate);

-- 데이터 검색
select * from board2;
select * from board2 where board_num=1;
--전체 데이터 갯수 확인
select count(*) as cnt from board2;

-- 데이터 삭제   
delete board2 where board_num=1;

-- 데이터 수정   
update board2 set board_re_seq=board_re_seq+1 
where board_re_ref=40 and board_re_seq>0;


select * from
(select rownum rn, tt.* from 
(select * from board2 order by board_re_ref desc, board_re_seq asc) tt)
where rn>=1 and rn<=5;


-- db 저장
commit;