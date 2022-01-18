package com.petshop.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.petshop.model.Customers;
import com.petshop.model.OrderItems;
import com.petshop.util.ConnectionUtil;




public class OrderItemsDAO  {
	
	ConnectionUtil connectionUtil = new ConnectionUtil();
	ResultSet resultSet=null;
	Connection connection=null;
	PreparedStatement pstmt=null;
	OrderItems orderitems=new OrderItems();
	List<OrderItems> orderItemList=new ArrayList<OrderItems>();
	String query="";
	
	//Commit for every DML operation
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
	
	// insert order item
	public void insertOrderItems(OrderItems orditm) {
		try {
			connection = connectionUtil.getDbConnect();
			query = "insert into order_items (order_id,pet_id,quantity,unit_price,total_price) values(?,?,?,?,?)";
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, orditm.getOrders().getOrderId());
			pstmt.setInt(2, orditm.getPet().getPetId());
			pstmt.setInt(3, orditm.getQuantity());
			pstmt.setDouble(4, orditm.getUnitPrice());
			pstmt.setDouble(5, orditm.getTotalPrice());
			pstmt.executeUpdate();
			commit();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	// Cancel Order item
	public void cancelOrderitem(OrderItems ord) {
		try {
			connection = connectionUtil.getDbConnect();
			query = "delete from order_items where item_id=?";
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, ord.getOrders().getOrderId());
			pstmt.executeUpdate();
			commit();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	
	//Show My order items List
	public List<OrderItems> showMyOrdersItemsList(Customers cus)  {
		try {
			connection = connectionUtil.getDbConnect();
			query = "select oi.order_id,oi.pet_id,p.pet_name,oi.quantity,oi.unit_price,oi.total_price,o.order_status,o.order_date,p.pet_image "
					+ "from order_items oi inner join orders o on oi.order_id=o.order_id inner join pet_details p on oi.pet_id=p.pet_id "
					+ "where o.customer_id='"+cus.getCustomerId()+"' order by o.order_id";
			pstmt = connection.prepareStatement(query);
			resultSet = pstmt.executeQuery();	
			while (resultSet.next()) {
				orderitems=new OrderItems();
				orderitems.getOrders().setOrderId(resultSet.getInt(1));
				orderitems.getPet().setPetId(resultSet.getInt(2));
				orderitems.getPet().setPetName(resultSet.getString(3));
				orderitems.setQuantity(resultSet.getInt(4));
				orderitems.setUnitPrice(resultSet.getDouble(5));
				orderitems.setTotalPrice(resultSet.getDouble(6));
				orderitems.getOrders().setOrderStatus(resultSet.getString(7));
				orderitems.getOrders().setOrderDate(resultSet.getDate(8));
				orderitems.getPet().setPetImage(resultSet.getString(9));			
				orderItemList.add(orderitems);
			}		
		}
		
		 catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}		
		return orderItemList;
	}
	
	
	// Get Current Order Item details 
	public List<OrderItems> getCurrentOrderItemDetails(int orderId){
		try {
			connection = connectionUtil.getDbConnect();
			String query = "select * from order_items where order_id='"+orderId+"'";
			pstmt = connection.prepareStatement(query);
			resultSet = pstmt.executeQuery();
			while(resultSet.next()) {
				orderitems=new OrderItems(resultSet.getInt(1),resultSet.getInt(2),resultSet.getInt(3),resultSet.getInt(4),resultSet.getDouble(5),resultSet.getDouble(6));
				orderItemList.add(orderitems);
			}		
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return orderItemList;
			}	
}
