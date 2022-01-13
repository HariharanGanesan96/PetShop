package com.petshop.dao;

import java.util.List;

import com.petshop.model.Orders;

public interface Ordersinterface {

	public void insert(Orders ord);
	
	public void updateStatus(Orders order);
	
	public List<Orders> showMyOrders(int cusId);
	
	public int orderId();
	
	
	
}
