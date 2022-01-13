package com.petshop.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.petshop.daoimpl.AdminDAO;
import com.petshop.daoimpl.CustomerDAO;
import com.petshop.model.Admin;
import com.petshop.model.Customers;

@WebServlet("/login")
public class login extends HttpServlet{
	
      @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	PrintWriter out=resp.getWriter();
    	//out.write("Login successed");
    	String userName=req.getParameter("usernameinput");
		String passwowrd=req.getParameter("passwordinput");
		
		Customers customerValidation=new Customers(userName,passwowrd);
		CustomerDAO customerDao=new CustomerDAO();
		
		String firstName=customerDao.cusValidation(customerValidation);

		HttpSession session=req.getSession();
		session.setAttribute("message", " ");
		if (firstName != null) {
			String name = firstName.substring(1);
			// customer login
			if (firstName.charAt(0) == '1') {
				session.setAttribute("message", "none");
				session.setAttribute("profileMessage", "none");
				//System.out.println("welcome user: " + name);
				Customers customerDetails=new Customers(userName,passwowrd);
				customerDetails = customerDao.customerDetails(userName);
				//System.out.println(customerDetails);
				session.setAttribute("customer", customerDetails);
				
				resp.sendRedirect("home.jsp");
			}
			else {
				System.out.println("welcome Admin: " + userName);
				Admin admin;
				AdminDAO adminDao=new AdminDAO();

					try {
						admin = adminDao.show(userName);
						session.setAttribute("Admin", admin);
						resp.sendRedirect("AdminHome.jsp");
						//System.out.println(admin);
					} catch (ClassNotFoundException | SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}	
			}				
}		else {
	            session.setAttribute("message", "visible");
	            resp.sendRedirect("index.jsp");
}

    }
      
      @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	doGet(req, resp);
    }
}
