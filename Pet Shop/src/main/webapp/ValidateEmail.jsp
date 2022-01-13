<%@page import="java.io.PrintWriter"%>
<%@page import="com.petshop.daoimpl.*"%>
<%@page import="java.util.*"%>
<%@page import="com.petshop.model.*"%>

<%Customers customer =new Customers();
 CustomerDAO customerDao=new CustomerDAO();
 String email=request.getParameter("email");
 customer.setEmail(email);
 boolean condition=customerDao.ValidateEmail(customer);
 PrintWriter write=response.getWriter();
 if(condition==false){
   write.print("Email not available");
 }
 else{
	 write.print("Available");
 }
 %>