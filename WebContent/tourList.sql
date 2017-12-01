create table tour_list(
num number,
tour_name varchar2(30) primary key,
tour_type varchar2(30),
tour_address varchar2(30),
tour_comment varchar2(50),
tour_img varchar2(50)
)
insert into TOUR_LIST values(tour_num.nextval,'건강과성박물관','박물관','33.494812, 126.538003','안녕하세요','images/ban_img1.jpg')
insert into TOUR_LIST values(tour_num.nextval,'명도암','자연','33.466228, 126.610623','명도암입니다.','images/ban_img2.jpg')
insert into TOUR_LIST values(tour_num.nextval,'김만덕기념관','박물관','33.515989, 126.530421','김만덕입니다.','images/ban_img3.jpg')
insert into TOUR_LIST values(tour_num.nextval,'무병장수테마파크','테마파크','33.395477, 126.361112','무병장수입니다..','images/ban_img1.jpg')


select * from TOUR_LIST

create sequence tour_num
start with 1
increment by 1;


drop table tour_list
drop sequence tour_num