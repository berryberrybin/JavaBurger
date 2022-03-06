drop table USERMEMBER;
--ȸ�� ���̺�
CREATE TABLE USERMEMBER (
	USER_ID	VARCHAR2(10)	primary key, --����� ID
	USER_PW	VARCHAR2(15)	not null, --��й�ȣ
	USER_NAME	VARCHAR2(15), --�̸�
	USER_PHONE	number(11) not null, --�ڵ�����ȣ
	USER_BIRTHDAY	number(8), --�������
  USER_JOINDATE date --���Գ�¥
);

insert into usermember values('cat01','catcat11','����',01011112222,19910101,SYSDATE);
insert into usermember values('dog02','dogdog02','�ھ���',01022223333,19920202,SYSDATE);
insert into usermember values('cow03','cowcow33','�ѼҼ�',01033334444,19930303,SYSDATE);

select * from usermember;

drop table COUPON;
--���� ���̺�
CREATE TABLE COUPON (
	COUPON_NO	NUMBER	primary key,
	COUPON_DETAIL	VARCHAR2(100),
	COUPON_DC_RATE	NUMBER(2),
	COUPON_EXP	NUMBER(8)
);

insert into coupon values(1010,'10% ����',10,20220401);
insert into coupon values(2020,'20% ����',20,20220501);

select * from coupon;



drop table USERCOUPON;


CREATE TABLE USERCOUPON (
	USER_COUPON_NO	NUMBER	primary key,
	USER_ID	VARCHAR2(10)	NOT NULL references usermember(user_id),
	COUPON_NO	NUMBER	NOT NULL references coupon(coupon_no),
	COUPON_AMOUNT	NUMBER
);

-- USER_COUPON_NO ������ ����
drop sequence USER_COUPON_NO_SEQ;
create sequence USER_COUPON_NO_SEQ NOCACHE;

insert into USERCOUPON(USER_COUPON_NO, USER_ID, COUPON_NO, COUPON_AMOUNT)
values (USER_COUPON_NO_SEQ.NEXTVAL,'cat01',1010,1);

insert into USERCOUPON(USER_COUPON_NO, USER_ID, COUPON_NO, COUPON_AMOUNT)
values (USER_COUPON_NO_SEQ.NEXTVAL,'dog02',2020,3);

insert into USERCOUPON(USER_COUPON_NO, USER_ID, COUPON_NO, COUPON_AMOUNT)
values (USER_COUPON_NO_SEQ.NEXTVAL,'dog02',1010,1);

select * from usercoupon;

--USER_COUPON_NO_SEQ �� ���簪 Ȯ��
select USER_COUPON_NO_SEQ.currval from dual;



drop table productcategory;
-- ��ǰī�װ� ���̺�
create table productcategory(
  category_no varchar2(1) primary key,
  category_name varchar2(10) not null
);

insert into productcategory values('A','Set');
insert into productcategory values ('B','Burger');
insert into productcategory values ('C','Side');
insert into productcategory values ('D','Drink');

select * from productcategory;


drop table product;
-- ��ǰ ���̺�
CREATE TABLE Product (
	PRD_NO	NUMBER	primary key,
	CATEGORY_NO	varchar2(1)	NOT NULL references productcategory(category_no),
	PRD_NAME	VARCHAR2(30),
	PRD_PRICE	NUMBER not null,
	PRD_DETAIL	VARCHAR2(100)
);

-- PRD_NO ������ ����
drop sequence PRD_NO_SEQ;
create sequence PRD_NO_SEQ NOCACHE;


insert into product
values(PRD_NO_SEQ.NEXTVAL,'A','�Ұ����ż�ƮM',5000,'�Ұ�����M, �ݶ�M, ����Ƣ��M');
insert into product
values(PRD_NO_SEQ.NEXTVAL,'A','������ż�ƮM',6000,'�������M, �ݶ�M, ����Ƣ��M');
insert into product
values(PRD_NO_SEQ.NEXTVAL,'B','�Ұ�����M',3500,'�޴���, M������');
insert into product
values(PRD_NO_SEQ.NEXTVAL,'B','�Ұ�����L',4000,'�޴���, L������');
insert into product
values(PRD_NO_SEQ.NEXTVAL,'B','�������M',4500,'�ʱ���, M������');
insert into product
values(PRD_NO_SEQ.NEXTVAL,'C','����Ƣ��M',1000,'�ٻ���,M������');
insert into product
values(PRD_NO_SEQ.NEXTVAL,'C','����Ƣ��L',1500,'�ٻ���,L������');
insert into product
values(PRD_NO_SEQ.NEXTVAL,'D','�ݶ�M',1000,'��ī�ݶ�');
insert into product
values(PRD_NO_SEQ.NEXTVAL,'D','�ݶ�L',1000,'ĥ�����̴�');

--PRD_NO_SEQ �� ���簪 Ȯ��
select PRD_NO_SEQ.currval from dual;

select * from product;


drop table productOption;
--�ɼ� ���̺�
create table productOption(
  OPT_NO	Number	primary key,
  CATEGORY_NO	VARCHAR2(1)	NOT NULL references productcategory(category_no),
	OPT_NAME	VARCHAR2(20),
	OPT_PRICE	NUMBER NOT NULL
);

-- OPT_NO ������ ����
drop sequence OPT_NO_SEQ;
create sequence OPT_NO_SEQ NOCACHE;

insert into productOption
values(OPT_NO_SEQ.NEXTVAL,'B','��Ŭ����',0);

insert into productOption
values(OPT_NO_SEQ.NEXTVAL,'B','��Ŭ�߰�',100);

insert into productOption
values(OPT_NO_SEQ.NEXTVAL,'B','ġ������',0);

insert into productOption
values(OPT_NO_SEQ.NEXTVAL,'B','ġ���߰�',100);

insert into productOption
values(OPT_NO_SEQ.NEXTVAL,'D','�ӽ�Ÿ���߰�',200);

insert into productOption
values(OPT_NO_SEQ.NEXTVAL,'D','�����߰�',100);

select * from productOption;



drop table Payment;
--���ų��� ���̺�
create table payment(
	PAY_NO	NUMBER	primary key,
	USER_ID	VARCHAR2(10)	NOT NULL references usermember(user_id),
	PAY_DATE	DATE,
	PAY_METHOD	NUMBER,
	PAY_PRICE	NUMBER,
	USER_COUPON_NO	NUMBER references usercoupon(USER_COUPON_NO)
);

-- PAY_NO ������ ����
drop sequence PAY_NO_SEQ;
create sequence PAY_NO_SEQ NOCACHE;

insert into payment
values(PAY_NO_SEQ.NEXTVAL,'cat01','2022-03-01',1,6000,null);

insert into payment
values(PAY_NO_SEQ.NEXTVAL,'cow03','2022-03-01',2,6000,null);

insert into payment
values(PAY_NO_SEQ.NEXTVAL,'dog02','2022-01-10',1,4500,1);

insert into payment
values(PAY_NO_SEQ.NEXTVAL,'dog02','2022-02-26',1,1000,null);

insert into payment
values(PAY_NO_SEQ.NEXTVAL,'dog02','2022-03-05',1,1200,null);

insert into payment
values(PAY_NO_SEQ.NEXTVAL,'cat01','2022-03-08',1,3600,null);

insert into payment
values(PAY_NO_SEQ.NEXTVAL,'cow03','2022-03-01',1,11500,null);

insert into payment
values(PAY_NO_SEQ.NEXTVAL,'dog02','2022-03-10',1,5000,null);

insert into payment
values(PAY_NO_SEQ.NEXTVAL,'dog02','2022-03-12',1,4000,2);

select * from payment



drop table orderoption;
--�ɼ��ֹ� ���� ���̺�
create table orderoption(
  ORDER_OPT_NO	NUMBER	primary key,
	ORDER_PRD_NO	NUMBER	NOT NULL references product(PRD_NO),
	OPT_NO	NUMBER references productOption(OPT_NO)
);

-- PRD_NO ������ ����
drop sequence ORDER_OPT_NO_SEQ;
create sequence ORDER_OPT_NO_SEQ;

insert into orderoption
values(ORDER_OPT_NO_SEQ.NEXTVAL,1,null);

insert into orderoption(ORDER_OPT_NO,ORDER_PRD_NO)
values(ORDER_OPT_NO_SEQ.NEXTVAL,2);


insert into orderoption
values(ORDER_OPT_NO_SEQ.NEXTVAL,5,5);

insert into orderoption
values(ORDER_OPT_NO_SEQ.NEXTVAL,6,1);

insert into orderoption
values(ORDER_OPT_NO_SEQ.NEXTVAL,6,4);


select * from orderoption

commit;
