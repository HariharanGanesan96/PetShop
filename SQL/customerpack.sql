create or replace PACKAGE CUSTOMER_OPERATION AS 

 PROCEDURE insert_customer(c_firstname in VARCHAR2, c_lastname in VARCHAR2, c_username in VARCHAR2,
 c_password in VARCHAR2,c_email in VARCHAR2,c_number in NUMBER,c_gender in VARCHAR2);

 PROCEDURE update_customer(c_firstname in VARCHAR2,c_lastname in VARCHAR2,c_username in VARCHAR2,
 c_password in VARCHAR2,c_email in VARCHAR2,c_number in VARCHAR2,c_gender in VARCHAR2,c_id in NUMBER);
 
 PROCEDURE updateAddress_customer(c_address in VARCHAR2,c_pincode in NUMBER,
 c_city in VARCHAR2,c_id in NUMBER);
 
 PROCEDURE delete_customer(c_id in NUMBER);
 
 FUNCTION validate_customer(c_username in VARCHAR2,c_password in VARCHAR2) RETURN varchar2;
 
 FUNCTION validateUsername_customer(c_username in VARCHAR2)RETURN varchar2;
 
 FUNCTION validateemail_customer(c_email in VARCHAR2)RETURN varchar2;
 
 PROCEDURE updateimage_customer(c_image in VARCHAR2,c_id in NUMBER);
 
 PROCEDURE updatewallet_customer(c_wallet in number,c_id in NUMBER);
 
END CUSTOMER_OPERATION;

CREATE OR REPLACE PACKAGE body CUSTOMER_OPERATION AS 

PROCEDURE insert_customer
(c_firstname in VARCHAR2,
 c_lastname in VARCHAR2,
 c_username in VARCHAR2,
 c_password in VARCHAR2,
 c_email in VARCHAR2,
 c_number in NUMBER,
 c_gender in VARCHAR2)
IS
BEGIN 
  insert into Customers(customer_firstname,customer_lastname,
  customer_username,customer_password,customer_email,customer_mobilenumber,
  customer_gender) values (c_firstname,c_lastname,c_username,c_password,c_email,c_number,c_gender); 
END insert_customer;

PROCEDURE update_customer
(c_firstname in VARCHAR2,
 c_lastname in VARCHAR2,
 c_username in VARCHAR2,
 c_password in VARCHAR2,
 c_email in VARCHAR2,
 c_number in VARCHAR2,
 c_gender in VARCHAR2,
 c_id in NUMBER)
IS
BEGIN 
  update Customers set customer_firstname=c_firstname,customer_lastname=c_lastname,
  customer_username=c_username,customer_password=c_password,customer_email=c_email,
  customer_mobilenumber=c_number,customer_gender=c_gender where customer_id=c_id; 
END update_customer; 

PROCEDURE updateAddress_customer
(c_address in VARCHAR2,
 c_pincode in NUMBER,
 c_city in VARCHAR2,
 c_id in NUMBER)
IS
BEGIN 
  update Customers set customer_address=c_address,customer_pincode=c_pincode,
  customer_city=c_city where customer_id=c_id;
END updateAddress_customer; 

PROCEDURE delete_customer
(c_id in NUMBER)
IS
BEGIN 
  delete from Customers where customer_id=c_id;
END delete_customer;

FUNCTION validate_customer(c_username in VARCHAR2,c_password in VARCHAR2)
RETURN varchar2
IS
firstname VARCHAR2(32);
begin
select admin_firstname into firstname 
from admin_details 
where admin_username=c_username and admin_password=c_password;  
return (1||firstname);
EXCEPTION 
WHEN NO_DATA_FOUND THEN
select customer_firstname into firstname
from customers 
where customer_username=c_username and customer_password=c_password;
return (2||firstname);
END validate_customer;

FUNCTION validateUsername_customer(c_username in VARCHAR2)
RETURN varchar2
IS
firstname VARCHAR2(32);
begin
select admin_firstname into firstname 
from admin_details 
where admin_username=c_username;  
return (1||firstname);
EXCEPTION 
WHEN NO_DATA_FOUND THEN
select customer_firstname into firstname
from customers 
where customer_username=c_username;
return (2||firstname);
END validateusername_customer;

FUNCTION validateemail_customer(c_email in VARCHAR2)
RETURN varchar2
IS
firstname VARCHAR2(32);
begin
select admin_firstname into firstname 
from admin_details 
where admin_email=c_email;  
return (1||firstname);
EXCEPTION 
WHEN NO_DATA_FOUND THEN
select customer_firstname into firstname
from customers 
where customer_email=c_email;
return (2||firstname);
END validateemail_customer;

PROCEDURE updateimage_customer
(c_image in VARCHAR2,
 c_id in NUMBER)
IS
BEGIN 
  update Customers set customer_image=c_image where customer_id=c_id;
END updateimage_customer; 

PROCEDURE updatewallet_customer
(c_wallet in number,
 c_id in NUMBER)
IS
BEGIN 
  update Customers set customer_wallet=c_wallet where customer_id=c_id;
END updatewallet_customer; 

end;