<%@page import="com.petshop.exception.LowWalletBalance"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.petshop.daoimpl.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.petshop.daoimpl.PetDAO"%>
<%@page import="java.util.*"%>
<%@page import="com.petshop.model.*"%>
<%@page import="java.sql.ResultSet"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	PrintWriter write = response.getWriter();
	

	Orders orders = new Orders();
	OrdersDAO ordersDao = new OrdersDAO();
	
	
	OrderItems orderItems = new OrderItems();
	OrderItemsDAO orderItemsDao = new OrderItemsDAO();
	
	PetDAO petDao = new PetDAO();
	
	CustomerDAO customerDao = new CustomerDAO();
	CartItemsDAO cartDao = new CartItemsDAO();
	
	
	
	int itemId = Integer.parseInt(request.getParameter("itemId"));
	
	CartItems cartItems = cartDao.showCart(itemId);

	Customers customerDetails = (Customers) session.getAttribute("customer");
		
	PetDetails pet = petDao.showPet(cartItems.getPet().getPetId());
	
	Customers petCustomerDetails = customerDao.customerDetails(pet.getCustomer().getCustomerId());
	
	if (customerDetails.getWallet() >= (cartItems.getTotalPrice())) {
		
		if (pet.getAvilableQty() >= cartItems.getQuantity()) {

			 orders.getCustomer().setCustomerId(customerDetails.getCustomerId());
			   orders.setTotalprice(cartItems.getTotalPrice());
			   
			   // insert values in orders
			   ordersDao.insert(orders);
			     
			   int orderId=ordersDao.orderId();  
			   orderItems.getOrders().setOrderId(orderId);
			   orderItems.getPet().setPetId(pet.getPetId());
			   orderItems.setQuantity(cartItems.getQuantity());
			   orderItems.setUnitPrice(cartItems.getUnitPrice());
			   orderItems.setTotalPrice(cartItems.getTotalPrice());
			   
			   // insert the values in order items
			   orderItemsDao.insert(orderItems);
			   
			   //update pet available quantity
			   pet.setAvilableQty((pet.getAvilableQty()-cartItems.getQuantity()));
			   petDao.updatePetAviQty(pet);
			   
			   //update buyer wallet
			   customerDetails.setWallet(customerDetails.getWallet()-(cartItems.getTotalPrice()));
			   customerDao.updateWallet(customerDetails);
			   
			   //update seller wallet
			   petCustomerDetails.setWallet(petCustomerDetails.getWallet()+(cartItems.getTotalPrice()));
			   customerDao.updateWallet(petCustomerDetails);
       
			
		    	cartDao.delete(cartItems.getItemId());
			   
		    	write.print("order placed sucussfully \n deducted Amount : "+cartItems.getTotalPrice()+
		    			"\n Wallet Amount : "+customerDetails.getWallet());
		} else {

			write.print("Quantity not avilable");
		}
	}

	else {
		try{
			
	   		throw new LowWalletBalance();
	   		}
	   		catch(LowWalletBalance e){	
	   			write.print(e+"\n Your wallet Balance"+customerDetails.getWallet()+
	   					       "\n Product Amount"+ cartItems.getTotalPrice());
	   		}
		 
	}
	%>
</body>
</html>