<%@page import="java.io.PrintWriter"%>
<%@page import="com.petshop.daoimpl.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.petshop.daoimpl.*"%>
<%@page import="java.util.*"%>
<%@page import="com.petshop.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%

Customers customerDetails=(Customers)session.getAttribute("customer");
CartItemsDAO cartItemsDao=new CartItemsDAO();
List<CartItems> cartList=(List<CartItems>)session.getAttribute("cartList");

for(CartItems cartItems:cartList){
      cartItemsDao.delete(cartItems.getItemId());
}

PrintWriter write=response.getWriter();
write.print("All Cart Items Are Deleted");

%>