package com.petshop.dao;

import java.util.List;

import com.petshop.model.Customers;
import com.petshop.model.OrderItems;

public interface OrderItemsInterface {
  
	public void insert(OrderItems orditm);
	
	public void delete(OrderItems ord);
	
	public List<OrderItems> showMyOrders(Customers cus);
	
	public List<OrderItems> getCurrentOrder(int orderId);
	
	
}
