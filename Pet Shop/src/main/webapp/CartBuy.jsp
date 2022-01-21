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
		
		CartItems cartItems = cartDao.showCartItem(itemId);

		Customers customerDetails = (Customers) session.getAttribute("customer");
			
		PetDetails pet = petDao.showCurrentPet(cartItems.getPet().getPetId());
		
		Customers petCustomerDetails = customerDao.customerDetails(pet.getCustomer().getCustomerId());
		
		if (customerDetails.getWallet() >= (cartItems.getTotalPrice())) {
			
			if (pet.getAvilableQty() >= cartItems.getQuantity()) {

		 orders.getCustomer().setCustomerId(customerDetails.getCustomerId());
		   orders.setTotalprice(cartItems.getTotalPrice());
		   
		   // insert values in orders
		   ordersDao.insertOrder(orders);
		     
		   int orderId=ordersDao.getCurrentOrderId();  
		   orderItems.getOrders().setOrderId(orderId);
		   orderItems.getPet().setPetId(pet.getPetId());
		   orderItems.setQuantity(cartItems.getQuantity());
		   orderItems.setUnitPrice(cartItems.getUnitPrice());
		   orderItems.setTotalPrice(cartItems.getTotalPrice());
		   
		   // insert the values in order items
		   orderItemsDao.insertOrderItems(orderItems);
		   
		   //update pet available quantity
		   pet.setAvilableQty((pet.getAvilableQty()-cartItems.getQuantity()));
		   petDao.updatePetAvailableQuantity(pet);
		   
		   //update buyer wallet
		   customerDetails.setWallet(customerDetails.getWallet()-(cartItems.getTotalPrice()));
		   customerDao.updateCustomerWallet(customerDetails);
		   
		   //update seller wallet
		   petCustomerDetails.setWallet(petCustomerDetails.getWallet()+(cartItems.getTotalPrice()));
		   customerDao.updateCustomerWallet(petCustomerDetails);
			       
		
			    	cartDao.deleteCartItem(cartItems.getItemId());
		   
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
		   			write.print(e+"\n Low wallet balance "+customerDetails.getWallet()+
		   					       "\n Product amount"+ cartItems.getTotalPrice());
		   		}
			 
		}
	%>
</body>
</html>