-- insert customer
CREATE OR REPLACE PROCEDURE insert_customer
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
/
-----------------------------------------------------------------------------------------------------
--update customer
CREATE OR REPLACE PROCEDURE update_customer
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
/
---------------------------------------------------------------------------------------------------------
--update bank and address detials
CREATE OR REPLACE PROCEDURE updateAddress_customer
(c_address in VARCHAR2,
 c_pincode in NUMBER,
 c_city in VARCHAR2,
 c_id in NUMBER)
IS
BEGIN 
  update Customers set customer_address=c_address,customer_pincode=c_pincode,
  customer_city=c_city where customer_id=c_id;
END updateAddress_customer; 
/
-----------------------------------------------------------------------------------------------------------
-- delete customers
CREATE OR REPLACE PROCEDURE delete_customer
(c_id in NUMBER)
IS
BEGIN 
  delete from Customers where customer_id=c_id;
END delete_customer; 
/
--------------------------------------------------------------------------------------------------------------
-- Validate customer
CREATE OR REPLACE FUNCTION validate_customer(c_username in VARCHAR2,c_password in VARCHAR2)
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
/

exec validate_customer('Hariharan96','Hari123!');

set SERVEROUT on
declare
   result VARCHAR2(32);
begin
   -- Call the function
   result := validate_customer('Hariharan96','Hari123!') ;
   DBMS_OUTPUT.PUT_LINE('result'||result);
end;

---------------------------------------------------------------------------------------------------------------------
-- Validate userName
CREATE OR REPLACE FUNCTION validateUsername_customer(c_username in VARCHAR2)
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
/

set SERVEROUT on
declare
   result VARCHAR2(32);
begin
   -- Call the function
   result := validateusername_customer('Adminhari') ;
   DBMS_OUTPUT.PUT_LINE('result  '||result);
end;
/
-----------------------------------------------------------------------------------------------------------
-- validate email
CREATE OR REPLACE FUNCTION validateemail_customer(c_email in VARCHAR2)
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
/

set SERVEROUT on
declare
   result VARCHAR2(32);
begin
   -- Call the function
   result := validateemail_customer('adminhari@gmail.com') ;
   DBMS_OUTPUT.PUT_LINE('result  '||result);
end;
/
------------------------------------------------------------------------------------------------------------------------
--Update Image customer
CREATE OR REPLACE PROCEDURE updateimage_customer
(c_image in VARCHAR2,
 c_id in NUMBER)
IS
BEGIN 
  update Customers set customer_image=c_image where customer_id=c_id;
END updateimage_customer; 
/
----------------------------------------------------------------------------------------------------------------------
--Update wallet customer
CREATE OR REPLACE PROCEDURE updatewallet_customer
(c_wallet in number,
 c_id in NUMBER)
IS
BEGIN 
  update Customers set customer_wallet=c_wallet where customer_id=c_id;
END updatewallet_customer; 
/