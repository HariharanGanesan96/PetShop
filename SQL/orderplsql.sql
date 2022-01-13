-- insert order
CREATE OR REPLACE PROCEDURE insert_orders
(c_id in NUMBER,
 t_price in number)
IS
BEGIN 
  insert into orders(Customer_id,total_price) values(c_id,t_price);
END insert_orders; 
/
----------------------------------------------------------------------------------------------------------
-- cancel status
CREATE OR REPLACE PROCEDURE cancel_orders
(o_id in number)
IS
BEGIN 
  update orders set order_status='cancelled' where order_id=o_id;
END cancel_orders; 
/
------------------------------------------------------------------------------------------------------------------
--get order_id
CREATE OR REPLACE FUNCTION getorderid_orders
RETURN varchar2
IS
order_id number(5);
begin
select max(order_id) into order_id 
from orders;  
return order_id;
END getorderid_orders;
/

set SERVEROUT on
declare
   result number(5);
begin
   -- Call the function
   result := getorderid_orders() ;
   DBMS_OUTPUT.PUT_LINE('result  '||result);
end;
/
----------------------------------------------------------------------------------------------------------------
-- insert order item
CREATE OR REPLACE PROCEDURE insert_ordersitems
(o_id in NUMBER,
 p_id in number,
 qty in number,
 u_price number,
 t_price in VARCHAR2)
IS
BEGIN 
insert into order_items (order_id,pet_id,quantity,unit_price,total_price) values(o_id,p_id,qty,u_price,t_price);
END insert_ordersitems; 
/
----------------------------------------------------------------------------------------------------------------
-- insert cart item
CREATE OR REPLACE PROCEDURE insert_cartitems
(p_id in NUMBER,
 c_id in number,
 qty in number,
 u_price number,
 t_price in VARCHAR2)
IS
BEGIN 
insert into cart_items (pet_id,customer_id,quantity,unit_price,total_price) values(p_id,c_id,qty,u_price,t_price);
END insert_cartitems; 
/
-----------------------------------------------------------------------------------------------------------------
-- update cart item
CREATE OR REPLACE PROCEDURE updateqty_cartitems
(i_id in NUMBER,
 qty in number)
IS
BEGIN 
update Cart_items set Quantity=qty where item_id=i_id;
END updateqty_cartitems; 
/
-----------------------------------------------------------------------------------------------------------------
-- delete cart items
CREATE OR REPLACE PROCEDURE delete_cartitems
(i_id in NUMBER)
IS
BEGIN 
delete from cart_items where item_id=i_id;
END delete_cartitems; 
/
-----------------------------------------------------------------------------------------------------------------
