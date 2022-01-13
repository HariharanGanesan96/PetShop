package com.petshop.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.petshop.model.Admin;
import com.petshop.util.ConnectionUtil;







public class AdminDAO {
	ConnectionUtil obj = new ConnectionUtil();
	
	public void insert(Admin adm) throws SQLException, ClassNotFoundException {
	Connection con = obj.getDbConnect();
	String query = "insert into animals_Adminuser values(?,?,?,?,?)";
	PreparedStatement pstmt = con.prepareStatement(query);
	pstmt.setInt(1, adm.getAdminId());
	pstmt.setString(2, adm.getUserName());
	pstmt.setString(3, adm.getPassword());
	pstmt.setString(3, adm.getPassword());
	pstmt.setString(4, adm.getPassword());
	pstmt.setDate(5, adm.getRegisterDate());
	
	System.out.println(pstmt.executeUpdate() + " rows inserted");
}

public void update(Admin adm) throws SQLException, ClassNotFoundException {
	Connection con = obj.getDbConnect();
	String query = "update animals_Adminuser set admin_password=? where admin_id=? ";
	PreparedStatement pstmt = con.prepareStatement(query);
	pstmt.setString(1, adm.getPassword());
	pstmt.setInt(2, adm.getAdminId());
	System.out.println(pstmt.executeUpdate() + " rows updated");
}

public void delete(Admin anim) throws SQLException, ClassNotFoundException {
	Connection con = obj.getDbConnect();
	String query = "delete from animals_Adminuser where admin_id=?";
	PreparedStatement pstmt = con.prepareStatement(query);
	pstmt.setInt(1, anim.getAdminId());
	System.out.println(pstmt.executeUpdate() + " rows deleted");
}

// Admin profile
public Admin show(String username) throws SQLException, ClassNotFoundException {
	
	Connection con = obj.getDbConnect();
	Admin admin=null;
	String query = "select * from Admin_details where admin_username='"+username+"'";
	PreparedStatement pstmt = con.prepareStatement(query);
	ResultSet re = pstmt.executeQuery();
	while (re.next()) {
	   admin=new Admin(re.getInt(1),re.getString(2),re.getString(3),re.getString(4),re.getString(4),re.getString(6),
			          re.getLong(7),re.getDate(8));
	}
     return admin;
}

}
