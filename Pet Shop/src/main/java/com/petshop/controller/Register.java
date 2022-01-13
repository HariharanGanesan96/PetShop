
package com.petshop.controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.petshop.util.ConnectionUtil;



@WebServlet("/register")
public class Register extends HttpServlet {
	public void service(HttpServletRequest req,HttpServletResponse res) throws IOException, ServletException {
		String firstName=req.getParameter("username");
		String LastName=req.getParameter("password");
		String gender=req.getParameter("gender");
		String userName=req.getParameter("username");
		String passweord=req.getParameter("password");
		String email=req.getParameter("email");
		long mobileNumber=Long.parseLong(req.getParameter("mobile"));	
		PrintWriter out=res.getWriter();
		
		
		ConnectionUtil obj = new ConnectionUtil();
		Connection con;
		try {
			con = obj.getDbConnect();
			String query = "insert into Customers(customer_firstname,customer_lastname,"
					+ "customer_username,customer_password,customer_email,customer_mobilenumber,customer_gender)\r\n"
					+ "values (?,?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1,firstName );
			pstmt.setString(2, LastName);
			pstmt.setString(3, userName);
			pstmt.setString(4, passweord);
			pstmt.setString(5, email);
			pstmt.setLong(6, mobileNumber);
			pstmt.setString(7, gender);
			int i = pstmt.executeUpdate();
			HttpSession session =req.getSession();
			if(i>0) {
			session.setAttribute("Register", "updated");
			res.sendRedirect("index.jsp");
			}
			else {
				session.setAttribute("Register", "Not updated");
				res.sendRedirect("Register.jsp");	
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
}
}