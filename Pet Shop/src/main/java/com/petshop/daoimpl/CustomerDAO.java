package com.petshop.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.petshop.model.Customers;
import com.petshop.util.ConnectionUtil;

public class CustomerDAO {

	ConnectionUtil connectionUtil = new ConnectionUtil();
	List<Customers> customerList = new ArrayList<Customers>();
	Customers customer = null;
	PreparedStatement pstmt = null;
	ResultSet resultSet=null;
	String query = "";
	Connection connection;

	// Commit for every DML operation
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

	// Register new Customer
	public void insertNewCustomer(Customers cus) {
		Connection con;
		try {
			con = connectionUtil.getDbConnect();
			query = "insert into Customers(customer_firstname,customer_lastname,"
					+ "customer_username,customer_password,customer_email,customer_mobilenumber,customer_gender)\r\n"
					+ "values (?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, cus.getFirstName());
			pstmt.setString(2, cus.getLastName());
			pstmt.setString(3, cus.getUserName());
			pstmt.setString(4, cus.getPassword());
			pstmt.setString(5, cus.getEmail());
			pstmt.setLong(6, cus.getNumber());
			pstmt.setString(7, cus.getGender());
			pstmt.executeUpdate();
			commit();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

	}

	
	// update Customer profile
	public void updateCustomerDetails(Customers customer) {
		try {
			connection = connectionUtil.getDbConnect();
			query = "update Customers set customer_firstname=?,customer_lastname=?,"
					+ "customer_username=?,customer_password=?,customer_email=?,customer_mobilenumber=?,customer_gender=? where customer_id=?";
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, customer.getFirstName());
			pstmt.setString(2, customer.getLastName());
			pstmt.setString(3, customer.getUserName());
			pstmt.setString(4, customer.getPassword());
			pstmt.setString(5, customer.getEmail());
			pstmt.setLong(6, customer.getNumber());
			pstmt.setString(7, customer.getGender());
			pstmt.setInt(8, customer.getCustomerId());
			pstmt.executeUpdate();
			commit();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

	// Update Customer Address Details
	public void updateAddressDetails(Customers customer) {
		try {
			connection = connectionUtil.getDbConnect();
			query = "update Customers set customer_address=?,customer_pincode=?,customer_city=? where customer_id=?";
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, customer.getAddress());
			pstmt.setInt(2, customer.getPincode());
			pstmt.setString(3, customer.getCity());
			pstmt.setInt(4, customer.getCustomerId());
			pstmt.executeUpdate();
			commit();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

	// Update customer status
	public void updateCustomerStatus(Customers customer, String status) {
		try {
			connection = connectionUtil.getDbConnect();
			query = "update Customers set status=? where customer_id=?";
            pstmt = connection.prepareStatement(query);
			pstmt.setString(1, status);
			pstmt.setInt(2, customer.getCustomerId());
			pstmt.executeUpdate();
			commit();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

	}

	
	// Customer login validation 
	public String customerLoginValidation(Customers customer) {
		try {
			connection = connectionUtil.getDbConnect();
		    query = "select customer_firstname from customers where customer_username=? and customer_password=?";
            pstmt = connection.prepareStatement(query);
			pstmt.setString(1, customer.getUserName());
			pstmt.setString(2, customer.getPassword());
			resultSet = pstmt.executeQuery();
			if (resultSet.next()) {
				customer.setFirstName(resultSet.getString(1));
				return "1" + resultSet.getString(1);
			} else if (true) {
				query = "select Admin_firstname from admin_details where admin_username=? and admin_password=?";
			    pstmt = connection.prepareStatement(query);
				pstmt.setString(1, customer.getUserName());
				pstmt.setString(2, customer.getPassword());
				resultSet = pstmt.executeQuery();
				if (resultSet.next()) {
					customer.setFirstName(resultSet.getString(1));
					return "2" + resultSet.getString(1);
				}
			}		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	// User name validation during register and update
	public boolean validateUsername(Customers customer) {
		boolean flag = true;
		try {
			connection = connectionUtil.getDbConnect();
		    query = "select * from customers where customer_username=?";
            pstmt = connection.prepareStatement(query);
			pstmt.setString(1, customer.getUserName());
		    resultSet = pstmt.executeQuery();
			if (resultSet.next()) {
				flag = false;
			} else if (true) {
				query = "select admin_firstname from admin_details where admin_username=?";
				pstmt = connection.prepareStatement(query);
				pstmt.setString(1, customer.getUserName());
				resultSet = pstmt.executeQuery();
				if (resultSet.next()) {
					flag = false;

				}
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	// Email validation during register and update
	public boolean validateEmail(Customers customer) {
		boolean flag = true;
		try {
			connection = connectionUtil.getDbConnect();
			query = "select * from customers where customer_email=?";
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, customer.getEmail());
		    resultSet = pstmt.executeQuery();
			if (resultSet.next()) {
				flag = false;
			} else if (true) {
				query = "select admin_email from admin_details where admin_email=?";
				pstmt = connection.prepareStatement(query);
				pstmt.setString(1, customer.getEmail());
			    resultSet= pstmt.executeQuery();
				if (resultSet.next()) {
					flag = false;
				}
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	// Show all customers
	public List<Customers> customersList() {
		try {
			connection = connectionUtil.getDbConnect();
			query = "select * from customers";
			pstmt = connection.prepareStatement(query);
		    resultSet = pstmt.executeQuery();
			while (resultSet.next()) {
				customer = new Customers(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(4),
						resultSet.getString(5), resultSet.getString(6), resultSet.getString(7), resultSet.getLong(8), resultSet.getDouble(9),
						resultSet.getDate(10), resultSet.getString(11), resultSet.getInt(12), resultSet.getString(12), resultSet.getString(14),
						resultSet.getString(15));
				customerList.add(customer);
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return customerList;

	}

	// Customer details using user name
	public Customers customerDetails(String userName) {
		try {
			connection = connectionUtil.getDbConnect();
			query = "select * from customers where Customer_username='" + userName + "'";
			pstmt = connection.prepareStatement(query);
			ResultSet resultSet = pstmt.executeQuery();
			while (resultSet.next()) {
				customer = new Customers(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(4),
						resultSet.getString(5), resultSet.getString(6), resultSet.getString(7), resultSet.getLong(8), resultSet.getDouble(9),
						resultSet.getDate(10), resultSet.getString(11), resultSet.getInt(12), resultSet.getString(13), resultSet.getString(14),
						resultSet.getString(15));
			}

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return customer;
	}
 
	// Customers details using id
	public Customers customerDetails(int customerId) {
		try {
			connection = connectionUtil.getDbConnect();
			query = "select * from customers where Customer_id=" + customerId + "";
			pstmt = connection.prepareStatement(query);
			resultSet = pstmt.executeQuery();
			while (resultSet.next()) {
				customer = new Customers(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3), resultSet.getString(4),
						resultSet.getString(5), resultSet.getString(6), resultSet.getString(7), resultSet.getLong(8), resultSet.getDouble(9),
						resultSet.getDate(10), resultSet.getString(11), resultSet.getInt(12), resultSet.getString(12), resultSet.getString(14),
						resultSet.getString(15));
			}

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return customer;
	}

	// Update Customer Image
	public void updateCustomerProfileImage(Customers cus) {
		try {
			connection = connectionUtil.getDbConnect();
			query = "update Customers set customer_image=? where customer_id=?";
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, cus.getImage());
			pstmt.setInt(2, cus.getCustomerId());
			pstmt.executeUpdate();
			commit();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

	//Update Wallet
	public void updateCustomerWallet(Customers cus) {
		try {
			connection = connectionUtil.getDbConnect();
			query = "update Customers set customer_wallet=? where customer_id=?";
			pstmt = connection.prepareStatement(query);
			pstmt.setDouble(1, cus.getWallet());
			pstmt.setInt(2, cus.getCustomerId());
			pstmt.executeUpdate();
			commit();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

}
