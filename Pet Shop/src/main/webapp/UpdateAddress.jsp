<%@page import="com.petshop.model.*"%>
<%@page import="com.petshop.daoimpl.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%
	String address = request.getParameter("address");
	String city = request.getParameter("city");
	int pinCode = Integer.parseInt(request.getParameter("pincode"));
	Customers customer = (Customers) session.getAttribute("customer");
	customer.setAddress(address);
	customer.setCity(city);
	customer.setPincode(pinCode);
	CustomerDAO customerDao = new CustomerDAO();
	customerDao.updateAddressDetails(customer);
	session.setAttribute("profileMessage", "address updated");
	response.sendRedirect("myprofile.jsp");
	%>
