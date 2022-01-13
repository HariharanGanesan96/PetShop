package com.petshop.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.petshop.dao.CartItemsInterface;
import com.petshop.model.CartItems;
import com.petshop.model.Customers;
import com.petshop.util.ConnectionUtil;





public class CartItemsDAO implements CartItemsInterface  {
	
	       // To get Connection from connection util
	       ConnectionUtil obj = new ConnectionUtil();
	       PreparedStatement pstmt =null;
	       
	   	public void commit() {
			Connection con;
			try {
				con = obj.getDbConnect();
				String query = "commit";
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.executeUpdate();
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	       
	    public void insert(CartItems cartit) {		
		Connection con;
	
		try {
			con = obj.getDbConnect();
			String query = "insert into Cart_items(pet_id,customer_id,quantity,unit_price,total_price) values(?,?,?,?,?)";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, cartit.getPet().getPetId());
			pstmt.setInt(2, cartit.getCustomer().getCustomerId());
			pstmt.setInt(3, cartit.getQuantity());
			pstmt.setDouble(4, cartit.getUnitPrice());
			pstmt.setDouble(5, cartit.getTotalPrice());
			pstmt.executeUpdate();
			commit();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}

	// To update order qty
	public void updateQty(int itemId,int qty){		
		String query = "update Cart_items set Quantity=? where item_id=?";
		PreparedStatement pstmt;
		try {
			Connection con = obj.getDbConnect();
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, qty);
			pstmt.setInt(2, itemId);
			pstmt.executeUpdate();
			commit();
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public void delete(int itemId) {
		Connection con;
		try {
			con = obj.getDbConnect();
			String query = "delete from cart_items where item_id="+itemId+"";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.executeUpdate();
			commit();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	
	public List<CartItems> showMyCart(Customers customer)  {	
		Connection con;
	     List<CartItems> cartList= new ArrayList<CartItems>();
		try {
			con = obj.getDbConnect();
			CartItems cartItem=new CartItems();
			String query = "select ci.item_id,ci.pet_id,ci.customer_id,ci.quantity,ci.unit_price,ci.total_price,p.pet_type,p.pet_name,pet_image from cart_items ci inner join pet_details p on p.pet_id=ci.pet_id where ci.customer_id="+customer.getCustomerId()+" order by ci.item_id";
			PreparedStatement pstmt = con.prepareStatement(query);
			ResultSet resultSet = pstmt.executeQuery(); 
			while (resultSet.next()) {
				cartItem=new CartItems(resultSet.getInt(1),resultSet.getInt(2),resultSet.getInt(3),resultSet.getInt(4),resultSet.getDouble(5),resultSet.getDouble(6));
				cartItem.getPet().setPetType(resultSet.getString(7));
				cartItem.getPet().setPetName(resultSet.getString(8));
				cartItem.getPet().setPetImage(resultSet.getString(9));
				
			    cartList.add(cartItem);
			}
			 return cartList;
			 
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cartList;
	}
	
	public CartItems showCart(int itemId)  {	
		Connection con;
	     CartItems cartItems= new CartItems();
		try {
			con = obj.getDbConnect();
			String query = "select * from cart_items where item_id="+itemId+"";
			PreparedStatement pstmt = con.prepareStatement(query);
			ResultSet resultSet = pstmt.executeQuery(); 
			while (resultSet.next()) {
				cartItems=new CartItems(resultSet.getInt(1),resultSet.getInt(2),resultSet.getInt(3),resultSet.getInt(4),resultSet.getDouble(5),resultSet.getDouble(6));						 
//			    cartItems.setItemId(resultSet.getInt(1));
//			    cartItems.getPet().setPetId(resultSet.getInt(2));
//			    cartItems.getCustomer().setCustomerId(resultSet.getInt(3));
//			    cartItems.setQuantity(resultSet.getInt(4));
//			    cartItems.setUnitPrice(resultSet.getDouble(5));
//			    cartItems.setTotalPrice(resultSet.getDouble(6));
			}	 
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cartItems;
	}

	
}
