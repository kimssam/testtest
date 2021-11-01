--성적관리 프로그램
create table score (
    id varchar2(30) not null,       --학번
    name varchar2(30) not null,     --이름
    korean number default 0,        --국어점수
    english number default 0,       --영어점수
    math number default 0,          --수학점수
    primary key(id)                 --학번이 기본키
);

-- 테이블 삭제
drop table score purge;
--테이블 목록 확인
select * from tab;

--데이터 저장
insert into score values ('992034', '홍길동' , 100, 90, 70);
insert into score values ('072034', '김민정' , 90, 80, 90);
insert into score values ('022034', '김영수' , 80, 90, 70);
insert into score values ('982034', '노홍철' , 90, 80, 95);
insert into score values ('052034', '유재석' , 70, 90, 90);
insert into score values ('992035', '홍길동' , 100, 90, 70);
insert into score values ('072035', '김민정' , 90, 80, 90);
insert into score values ('022035', '김영수' , 80, 90, 70);
insert into score values ('982035', '노홍철' , 90, 80, 95);
insert into score values ('052035', '유재석' , 70, 90, 90);
insert into score values ('192034', '홍길동' , 100, 90, 70);
insert into score values ('172034', '김민정' , 90, 80, 90);
insert into score values ('122034', '김영수' , 80, 90, 70);
insert into score values ('182034', '노홍철' , 90, 80, 95);
insert into score values ('152034', '유재석' , 70, 90, 90);
insert into score values ('192035', '홍길동' , 100, 90, 70);
insert into score values ('172035', '김민정' , 90, 80, 90);
insert into score values ('122035', '김영수' , 80, 90, 70);
insert into score values ('182035', '노홍철' , 90, 80, 95);
insert into score values ('152035', '유재석' , 70, 90, 90);

--데이터 검색
select * from score;
select * from score where id = 982034;
select * from
(select rownum rn, tt.*from
(select * from score order by id asc) tt)
where rn>=1 and rn<=10;

--전체 데이터 갯수확인
select count(*) as cnt from score;

--데이터 삭제
delete score where  id = 982034;
delete score;

--DB저장
commit;