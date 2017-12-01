create table tour_list(
num number,
tour_name varchar2(30) primary key,
tour_type varchar2(30),
tour_address varchar2(30),
tour_comment varchar2(50),
tour_img varchar2(50)
)
insert into TOUR_LIST values(tour_num.nextval,'�ǰ������ڹ���','�ڹ���','33.494812, 126.538003','�ȳ��ϼ���','images/ban_img1.jpg')
insert into TOUR_LIST values(tour_num.nextval,'����','�ڿ�','33.466228, 126.610623','�����Դϴ�.','images/ban_img2.jpg')
insert into TOUR_LIST values(tour_num.nextval,'�踸������','�ڹ���','33.515989, 126.530421','�踸���Դϴ�.','images/ban_img3.jpg')
insert into TOUR_LIST values(tour_num.nextval,'��������׸���ũ','�׸���ũ','33.395477, 126.361112','��������Դϴ�..','images/ban_img1.jpg')


select * from TOUR_LIST

create sequence tour_num
start with 1
increment by 1;


drop table tour_list
drop sequence tour_num