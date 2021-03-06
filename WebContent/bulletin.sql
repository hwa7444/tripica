// 작성 번호, 글 제목, 작성자, 올린 파일 이름, 작성내용, 작성일자, 게시글삭제유무(0,1)
create table bulletin (
num number, 
title varchar(50),
nick varchar(50),
fileName varchar(50),
content varchar(2048),
writeDay varchar(30),
checkD number
)

drop table bulletin

create sequence num
start with 1
increment by 1
drop sequence num
select * from bulletin

select * from bulletin order by num;

select count(*) as cnt from bulletin

select * from (select * from bulletin order by num desc) where rownum between 11 and 20