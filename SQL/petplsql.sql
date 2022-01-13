-- insert pet
CREATE OR REPLACE PROCEDURE insert_pet
(p_type in VARCHAR2,
 p_name in VARCHAR2,
 p_gender in VARCHAR2,
 p_dob in date,
 p_qty in number,
 p_discription in VARCHAR2,
 p_color in VARCHAR2,
 p_price in number,
 p_image in VARCHAR2,
 c_id in NUMBER,
 a_qty in number)
IS
BEGIN 
  INSERT into pet_details(pet_type,pet_name,pet_gender,pet_dob,pet_Qty,pet_description,
  pet_color,pet_price,pet_image,customer_id,available_qty) values(p_type,p_name,p_gender,
  p_dob,p_qty,p_discription,p_color,p_price,p_image,c_id,a_qty);
END insert_pet; 
/
----------------------------------------------------------------------------------------------------------
-- update pet
CREATE OR REPLACE PROCEDURE update_pet
(p_type in VARCHAR2,
 p_name in VARCHAR2,
 p_gender in VARCHAR2,
 p_dob in date,
 p_qty in number,
 p_discription in VARCHAR2,
 p_color in VARCHAR2,
 p_price in number,
 p_image in VARCHAR2,
 c_id in NUMBER,
 a_qty in number,
 p_id in number)
IS
BEGIN 
  update pet_details set pet_type=p_type,pet_name=P_name,pet_gender=p_gender,pet_dob=p_dob,pet_Qty=p_qty,
  pet_description=p_discription,pet_color=p_color,pet_price=p_price,pet_image=p_image,customer_id=c_id,
  available_qty=a_qty where pet_id=p_id;
END update_pet; 
/
------------------------------------------------------------------------------------------------------------------
--update status
CREATE OR REPLACE PROCEDURE updatestatus_pet
(p_status in VARCHAR2,
 a_id in number,
 p_id in number)
IS
BEGIN 
  update pet_details set status=p_status,admin_id=a_id where pet_id=p_id;
END updatestatus_pet; 
/
------------------------------------------------------------------------------------------------------------------
--delete pet
CREATE OR REPLACE PROCEDURE delete_pet
(p_id in NUMBER)
IS
BEGIN 
  delete from pet_details where pet_id=p_id;
END delete_pet; 
/
-----------------------------------------------------------------------------------------------------------------
--update AvailableQty
CREATE OR REPLACE PROCEDURE updateavailableqty_pet
(a_qty in number,
 p_id in number)
IS
BEGIN 
  update Pet_details set available_qty=a_qty where pet_id=p_id;
END updateavailableqty_pet; 
/
-----------------------------------------------------------------------------------------------------------------
