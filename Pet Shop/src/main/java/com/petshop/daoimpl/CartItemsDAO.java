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

public class CartItemsDAO implements CartItemsInterface {

	// To get Connection from connection jdbc
	ConnectionUtil connectionUtil = new ConnectionUtil();
	List<CartItems> cartList = new ArrayList<CartItems>();
	CartItems cartItem = new CartItems();
	PreparedStatement pstmt = null;
	ResultSet resultSet = null;
	Connection connection;
	String query = "";

	// Commit during DML operation
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

	// Insert Cart Items
	public void insertCartItem(CartItems cartit) {
		Connection con;

		try {
			con = connectionUtil.getDbConnect();
			query = "insert into Cart_items(pet_id,customer_id,quantity,unit_price,total_price) values(?,?,?,?,?)";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, cartit.getPet().getPetId());
			pstmt.setInt(2, cartit.getCustomer().getCustomerId());
			pstmt.setInt(3, cartit.getQuantity());
			pstmt.setDouble(4, cartit.getUnitPrice());
			pstmt.setDouble(5, cartit.getTotalPrice());
			pstmt.executeUpdate();
			commit();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// To update cartItems Quantity
	public void updateCartItemQuantity(int itemId, int qty) {
		query = "update Cart_items set Quantity=? where item_id=?";
		try {
			connection = connectionUtil.getDbConnect();
			pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, qty);
			pstmt.setInt(2, itemId);
			pstmt.executeUpdate();
			commit();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	// Delete Cart item
	public void deleteCartItem(int itemId) {
		try {
			connection = connectionUtil.getDbConnect();
			query = "delete from cart_items where item_id=" + itemId + "";
			pstmt = connection.prepareStatement(query);
			pstmt.executeUpdate();
			commit();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

	}

	// Show My Cart Items
	public List<CartItems> showAllCartItems(Customers customer) {

		
		try {
			connection = connectionUtil.getDbConnect();
			query = "select ci.item_id,ci.pet_id,ci.customer_id,ci.quantity,ci.unit_price,ci.total_price,p.pet_type,p.pet_name,pet_image from cart_items ci inner join pet_details p on p.pet_id=ci.pet_id where ci.customer_id="
					+ customer.getCustomerId() + " order by ci.item_id";
			pstmt = connection.prepareStatement(query);
			resultSet = pstmt.executeQuery();
			while (resultSet.next()) {
				cartItem = new CartItems(resultSet.getInt(1), resultSet.getInt(2), resultSet.getInt(3),
						resultSet.getInt(4), resultSet.getDouble(5), resultSet.getDouble(6));
				cartItem.getPet().setPetType(resultSet.getString(7));
				cartItem.getPet().setPetName(resultSet.getString(8));
				cartItem.getPet().setPetImage(resultSet.getString(9));
				cartList.add(cartItem);
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return cartList;
	}

	// Show Particular Cart Item
	public CartItems showCartItem(int itemId) {
		try {
			connection = connectionUtil.getDbConnect();
			query = "select * from cart_items where item_id=" + itemId + "";
			pstmt = connection.prepareStatement(query);
			resultSet = pstmt.executeQuery();
			while (resultSet.next()) {
				cartItem = new CartItems(resultSet.getInt(1), resultSet.getInt(2), resultSet.getInt(3),
						resultSet.getInt(4), resultSet.getDouble(5), resultSet.getDouble(6));
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return cartItem;
	}

}
