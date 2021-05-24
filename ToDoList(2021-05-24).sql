--  접속

create table tbl_list(
    li_seq	number		primary key,
    li_date	varchar2(10)	not null,	
    li_time	varchar2(10)	not null,	
    li_place	nvarchar2(50)	not null,	
    li_content	nvarchar2(1000)	not null	
);
CREATE SEQUENCE seq_list
START WITH 1 INCREMENT BY 1;

INSERT INTo tbl_list(li_seq, li_date, li_time, li_place, li_content)
VALUES(SEQ_LIST.nextval,'2021-05-24','10:31:52','광주','Text');

select * from tbl_list;