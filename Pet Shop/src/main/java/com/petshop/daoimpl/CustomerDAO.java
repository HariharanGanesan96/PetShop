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

	ConnectionUtil obj = new ConnectionUtil();
	List<Customers> customerList=new ArrayList<Customers>();
	
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

	//Register user
	public void insert(Customers cus)  {
		Connection con;
		try {
			con = obj.getDbConnect();
			String query = "insert into Customers(customer_firstname,customer_lastname,"
					+ "customer_username,customer_password,customer_email,customer_mobilenumber,customer_gender)\r\n"
					+ "values (?,?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, cus.getFirstName());
			pstmt.setString(2, cus.getLastName());
			pstmt.setString(3, cus.getUserName());
			pstmt.setString(4, cus.getPassword());
			pstmt.setString(5, cus.getEmail());
			pstmt.setLong(6, cus.getNumber());
			pstmt.setString(7, cus.getGender());
			int i = pstmt.executeUpdate();
			commit();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//update Customer profile
	public void update(Customers customer)  {
		Connection con;
		try {
			System.out.println(customer);
			con = obj.getDbConnect();
			String query = "update Customers set customer_firstname=?,customer_lastname=?,"
					+ "customer_username=?,customer_password=?,customer_email=?,customer_mobilenumber=?,customer_gender=? where customer_id=?";
			PreparedStatement pstmt = con.prepareStatement(query);
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}	
	
	// update Address details
	public void updateAddressDetails(Customers cus)  {
		Connection con;
		try {
			con = obj.getDbConnect();
			String query = "update Customers set customer_address=?,customer_pincode=?,customer_city=? where customer_id=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, cus.getAddress());
			pstmt.setInt(2, cus.getPincode());
			pstmt.setString(3, cus.getCity());
			pstmt.setInt(4, cus.getCustomerId());
			pstmt.executeUpdate();
			commit();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}	
    
	//Update customer status
	public void delete(Customers customer,String status) {
		Connection con;
		try {
			con = obj.getDbConnect();
			String query = "update Customers set status=? where customer_id=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, status);
			pstmt.setInt(2, customer.getCustomerId());
			pstmt.executeUpdate();
			commit();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	//customer validation login
	public String cusValidation(Customers cus) {
		Connection con;
		try {
			con = obj.getDbConnect();
			String query = "select customer_firstname from customers where customer_username=? and customer_password=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, cus.getUserName());
			pstmt.setString(2, cus.getPassword());
			ResultSet re = pstmt.executeQuery();
			if (re.next()) {
				cus.setFirstName(re.getString(1));
				return "1" + re.getString(1);
			} 
			else if (true) {
				query = "select Admin_firstname from admin_details where admin_username=? and admin_password=?";
				PreparedStatement pstmt1 = con.prepareStatement(query);
				pstmt1.setString(1, cus.getUserName());
				pstmt1.setString(2, cus.getPassword());
				ResultSet re1 = pstmt1.executeQuery();
				if (re1.next()) {
					cus.setFirstName(re1.getString(1));
					return "2" + re1.getString(1);
				}
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

	
	//Username validation
	public boolean ValidatUsername(Customers customer)  {
		Connection con;
		boolean flag = true;
		try {
			con = obj.getDbConnect();
			String query = "select * from customers where customer_username=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, customer.getUserName());
			ResultSet re = pstmt.executeQuery();
			if (re.next()) {
				flag = false;
			} else if (true) {
				query = "select admin_firstname from admin_details where admin_username=?";
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, customer.getUserName());
				ResultSet re1 = pstmt.executeQuery();
				if (re1.next()) {
					flag = false;

				}
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return flag;
	}

	// Email validation
	public boolean ValidateEmail(Customers customer) {
		Connection con;
		boolean flag = true;
		try {
			con = obj.getDbConnect();
			String query = "select * from customers where customer_email=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, customer.getEmail());
			ResultSet re = pstmt.executeQuery();
			if (re.next()) {
				flag = false;
			} else if (true) {
				query = "select admin_email from admin_details where admin_email=?";
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, customer.getEmail());
				ResultSet re1 = pstmt.executeQuery();
				if (re1.next()) {
					flag = false;
				}
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	// Show all customer
	public List<Customers> showCustomerList(){
		Connection con;
		
		try {
			con = obj.getDbConnect();
			String query = "select * from customers";
			PreparedStatement pstmt = con.prepareStatement(query);
			  Customers customerDetails=null;
			ResultSet re = pstmt.executeQuery();
			while (re.next()) {	
	        	customerDetails=new Customers(re.getInt(1), re.getString(2), re.getString(3), re.getString(4),
						re.getString(5), re.getString(6), re.getString(7), re.getLong(8), re.getDouble(9), re.getDate(10),
						re.getString(11), re.getInt(12), re.getString(12), re.getString(14),re.getString(15));
	        	customerList.add(customerDetails);
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return customerList;
		
	}
	
	//my Profile
	public Customers customerDetails(String userName) {	
		Customers customer =null;
		Connection con;
		try {
			con = obj.getDbConnect();
			String query = "select * from customers where Customer_username='"+userName+"'";
			PreparedStatement pstmt = con.prepareStatement(query);
			ResultSet re = pstmt.executeQuery();
			while (re.next()) {
				 customer=new Customers(re.getInt(1), re.getString(2), re.getString(3), re.getString(4),
						re.getString(5), re.getString(6), re.getString(7), re.getLong(8), re.getDouble(9), re.getDate(10),
						re.getString(11), re.getInt(12), re.getString(13), re.getString(14),re.getString(15));
				
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		return customer;
	}
	
	public Customers customerDetails(int customerId) {	
		System.out.println(customerId);
		Customers customer =new Customers();
		Connection con;
		try {
			con = obj.getDbConnect();
			String query = "select * from customers where Customer_id="+customerId+"";
			PreparedStatement pstmt = con.prepareStatement(query);
			ResultSet re = pstmt.executeQuery();
			while (re.next()) {
				 customer=new Customers(re.getInt(1), re.getString(2), re.getString(3), re.getString(4),
						re.getString(5), re.getString(6), re.getString(7), re.getLong(8), re.getDouble(9), re.getDate(10),
						re.getString(11), re.getInt(12), re.getString(12), re.getString(14),re.getString(15));
				
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(customer);

		return customer;
	}
	
	
	public void updateImage(Customers cus)  {
		Connection con;
		try {
			con = obj.getDbConnect();
			String query = "update Customers set customer_image=? where customer_id=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1,cus.getImage());
			pstmt.setInt(2, cus.getCustomerId());
			pstmt.executeUpdate();
			commit();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public void updateWallet(Customers cus) {
		Connection con;
		try {
			con = obj.getDbConnect();
			String query = "update Customers set customer_wallet=? where customer_id=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setDouble(1,cus.getWallet());
			pstmt.setInt(2, cus.getCustomerId());
			pstmt.executeUpdate();
			commit();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
