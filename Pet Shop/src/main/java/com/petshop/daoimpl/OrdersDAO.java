package com.petshop.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.petshop.model.Orders;
import com.petshop.util.ConnectionUtil;




public class OrdersDAO{
	
	// To get connection from connection util
	ConnectionUtil connectionUtil = new ConnectionUtil();
	Connection connection=null;
	String query="";
	PreparedStatement pstmt=null;
	ResultSet resultSet=null;
	
	
	// commit every DML operation
	public void commit() {
		try {
			connection = connectionUtil.getDbConnect();
			query = "commit";
			pstmt = connection.prepareStatement(query);
			pstmt.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	
	//insert order 
	public void insertOrder(Orders ord) {
		try {
			connection = connectionUtil.getDbConnect();
			query = "insert into orders(Customer_id,total_price) \r\n"
					+ "values(?,?)";
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, ord.getCustomer().getCustomerId());
			pstmt.setDouble(2, ord.getTotalprice());
			pstmt.executeUpdate();
			commit();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
        
	// Cancel order
	public void updateOrderStatus(Orders order)  {
		try {
			connection = connectionUtil.getDbConnect();
			query = "update orders set order_status='cancelled' where order_id=?";
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, order.getOrderId());
			pstmt.executeUpdate();
			commit();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
	}
    
	// To show my orders 	
	public List<Orders> showMyOrders(int cusId) {
		try {
			connection = connectionUtil.getDbConnect();
			query = "select * from orders o inner join order_items oi"
					+ "on o.order_id=oi.order_id where customer_id='"+cusId+"'";
			pstmt = connection.prepareStatement(query);
			resultSet = pstmt.executeQuery();
			while (resultSet.next()) {				
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
   
	// To get last orderId value to insert
	public int getCurrentOrderId() {
		int orderid=0;
		try {
			connection = connectionUtil.getDbConnect();
			query = "select max(order_id) from orders";
			pstmt = connection.prepareStatement(query);
			resultSet = pstmt.executeQuery();
			while (resultSet.next()) {
				orderid=resultSet.getInt(1);
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
       return orderid;
	}	
}
