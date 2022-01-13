package com.petshop.dao;

import java.util.List;

import com.petshop.model.CartItems;
import com.petshop.model.Customers;

public interface CartItemsInterface {
 
	   public void insert(CartItems cartit);
	   
	   public void updateQty(int itemId,int qty);
	   
	   public void delete(int itemId);
	   
	   public List<CartItems> showMyCart(Customers customer);
	   
	   public CartItems showCart(int itemId);
	
		
}
