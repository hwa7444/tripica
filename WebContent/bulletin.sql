// �ۼ� ��ȣ, �� ����, �ۼ���, �ø� ���� �̸�, �ۼ�����, �ۼ�����, �Խñۻ�������(0,1)
create table bulletin (
num number, 
title varchar(50),
nick varchar(50),
fileName varchar(30),
content varchar(2048),
writeDay varchar(30),
checkD number
)

drop table bulletin

create sequence num
start with 1
increment by 1
select * from bulletin

select * from bulletin order by num;