package com.petshop.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.petshop.model.Admin;
import com.petshop.util.ConnectionUtil;

public class AdminDAO {

	ConnectionUtil obj = new ConnectionUtil();
	PreparedStatement pstmt = null;

	// Admin Register
	public void insert(Admin admin) throws SQLException, ClassNotFoundException {
		Connection con = obj.getDbConnect();
		String query = "insert into admin_details values(?,?,?,?,?)";
		pstmt = con.prepareStatement(query);
		pstmt.setInt(1, admin.getAdminId());
		pstmt.setString(2, admin.getUserName());
		pstmt.setString(3, admin.getPassword());
		pstmt.setString(3, admin.getPassword());
		pstmt.setString(4, admin.getPassword());
		pstmt.setDate(5, admin.getRegisterDate());
		pstmt.executeUpdate();
	}
   
	//Update Admin
	public void update(Admin admin) throws SQLException, ClassNotFoundException {
		Connection con = obj.getDbConnect();
		String query = "update admin_details set admin_password=? where admin_id=? ";
		pstmt = con.prepareStatement(query);
		pstmt.setString(1, admin.getPassword());
		pstmt.setInt(2, admin.getAdminId());
		pstmt.executeUpdate();
	}

	// Delete Admin
	public void delete(Admin anim) throws SQLException, ClassNotFoundException {
		Connection con = obj.getDbConnect();
		String query = "delete from animals_Adminuser where admin_id=?";
		pstmt = con.prepareStatement(query);
		pstmt.setInt(1, anim.getAdminId());
		pstmt.executeUpdate();
	}

     // Admin profile Details
	    public Admin show(String username) throws SQLException, ClassNotFoundException {
		Connection con = obj.getDbConnect();
		Admin admin = null;
		String query = "select * from Admin_details where admin_username='" + username + "'";
		PreparedStatement pstmt = con.prepareStatement(query);
		ResultSet re = pstmt.executeQuery();
		while (re.next()) {
			admin = new Admin(re.getInt(1), re.getString(2), re.getString(3), re.getString(4), re.getString(4),
					re.getString(6), re.getLong(7), re.getDate(8));
		}
		return admin;
	}

}
