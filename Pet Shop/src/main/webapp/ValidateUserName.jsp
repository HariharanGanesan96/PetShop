<%@page import="java.io.PrintWriter"%>
<%@page import="com.petshop.daoimpl.*"%>
<%@page import="java.util.*"%>
<%@page import="com.petshop.model.*"%>
<%Customers customer =new Customers();
 CustomerDAO customerDao=new CustomerDAO();
 String userName=request.getParameter("userName");
 customer.setUserName(userName);
 boolean condition=customerDao.ValidatUsername(customer);
 if(condition==false){
   out.print("UserName Not available");
 }
 else{
	  out.print("Available");
 }
 %>