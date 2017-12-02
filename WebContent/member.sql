drop table member
drop table bulletin

drop sequence member_num
drop sequence numCREATE 


create table bulletin (
bulletin_num number, 
title varchar(50),
nick varchar(50),
fileName varchar(50),
content varchar(2048),
writeDay varchar(30),
checkD number
)

create table member(
userid number,
mem_id varchar(20) primary key,
pw varchar(20),
nick varchar(20),
gender number,
phone varchar(20),
birthday varchar(20))

create sequence member_num
start with 1
increment by 1

create sequence b_num
start with 1
increment by 1

