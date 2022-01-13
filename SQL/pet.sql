create table pet_details(
pet_id number(5) GENERATED ALWAYS AS IDENTITY START WITH 1 primary key ,
pet_type varchar2(20) not null ,
pet_name varchar2(50) not null ,
pet_gender varchar2(10),
pet_dob date,
pet_Qty number(3) CONSTRAINT petqty check (pet_qty>0) not null ,
pet_Description varchar2(1000),
pet_color varchar2(20),
pet_price number(12,2) CONSTRAINT petprice check (pet_price>0) not null,
pet_image VARCHAR2(4000) not null,
Status varchar2(30) default 'Not approved',
Customer_id number(5) not null,
admin_id number(5) default 0,
Available_Qty number(3) default 0,
pet_registerdate date default (sysdate));





create table Customers (
Customer_id number(5) GENERATED ALWAYS AS IDENTITY START WITH 1 primary key ,
Customer_firstname VARCHAR2(32) Not null,
Customer_lastname VARCHAR2(32) Not null,
Customer_gender varchar2(10) default 'male',
Customer_username VARCHAR2(32) UNIQUE not null,
Customer_password varchar2(32) not null,
Customer_email VARCHAR2(32) unique not null,
Customer_mobilenumber number(15) not null,
customer_image VARCHAR2(4000) DEFAULT 'default.jpg',
Customer_wallet number(20) default 000000,
Customer_address varchar2(300) DEFAULT 'none',
customer_city VARCHAR2(50) default 'none',
Customer_pincode number(8) DEFAULT 000000,
Customer_reg_date date default (sysdate),
status varchar2(20) default 'active');


create table orders(
Order_id number(5) GENERATED ALWAYS AS IDENTITY START WITH 1 primary key ,
Customer_id number(5) not null,
order_date date default sysdate,
Total_price number(15,2) not null,
order_status varchar2(20) default 'NotDelivered',
CONSTRAINT FK_OrderCustomerId foreign key(Customer_id) REFERENCES customers(Customer_id));


create table order_items(
item_id number(5)GENERATED ALWAYS AS IDENTITY START WITH 1 primary key,
order_id number(5) not null,
pet_id number(5) not null,
Quantity number(5) not NULL,
unit_price number(10,2) not null,
total_price number(15,2)not null,
CONSTRAINT FK_OrderItemsPetId foreign key(pet_id) REFERENCES Pet_details(pet_id),
CONSTRAINT FK_OrderItemsOrderId foreign key(order_id) REFERENCES orders(order_id));


create table cart_items(
item_id number(5) GENERATED ALWAYS AS IDENTITY START WITH 1 primary key,
pet_id number(5) not null,
customer_id number(5) not null,
Quantity number(5) not null,
unit_price number(10,2) not null,
total_price number(15,2) not null,
CONSTRAINT FK_CartItemsPetId foreign key(pet_id) REFERENCES pet_details(pet_id),
CONSTRAINT FK_CartItemsCustomerId foreign key(Customer_id) REFERENCES customers(Customer_id));


create table Admin_details(
Admin_id number(5) GENERATED ALWAYS AS IDENTITY START WITH 1 primary key,
admin_FirstName varchar2(32) not null,
admin_LastName varchar2(32) not null,
Admin_username varchar2(32) not null UNIQUE,
admin_password varchar(32) not null,
admin_Email varchar2(50) not null,
admin_number number(15)not null,
admin_registerDate date default (sysdate));






