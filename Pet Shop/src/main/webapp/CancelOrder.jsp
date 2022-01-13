<%@page import="org.apache.jasper.compiler.JavacErrorDetail"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.petshop.daoimpl.*"%>
<%@page import="java.util.*"%>
<%@page import="com.petshop.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	
    Customers customerDetails = (Customers) session.getAttribute("customer");
   
	CustomerDAO customerDao = new CustomerDAO();
	Customers customer = new Customers();
	PetDetails pet = new PetDetails();
	PetDAO petDao = new PetDAO();
	OrderItems orderItems = new OrderItems();
	OrderItemsDAO orderItemDao = new OrderItemsDAO();
	List<OrderItems> orderItemList = new ArrayList<OrderItems>();
	Orders order = new Orders();
	OrdersDAO orderDao = new OrdersDAO();
	int orderId = Integer.parseInt(request.getParameter("orderId"));
	
	order.setOrderId(orderId);
	orderItemList = orderItemDao.getCurrentOrder(orderId);

	int Amount = 0;
	
	for (OrderItems orderItem : orderItemList) {
		
		
	pet = petDao.showPet(orderItem.getPet().getPetId());

	pet.setAvilableQty((pet.getAvilableQty() + orderItem.getQuantity()));
	petDao.updatePetAviQty(pet);

	Amount += orderItem.getTotalPrice();
	
	customerDetails.setWallet(customerDetails.getWallet() + (orderItem.getTotalPrice()));
	customerDao.updateWallet(customerDetails);

	customer = customerDao.customerDetails(pet.getCustomer().getCustomerId());
	customer.setWallet(customer.getWallet() - orderItem.getTotalPrice());
	customerDao.updateWallet(customer);

}
    orderDao.updateStatus(order);
    PrintWriter write = response.getWriter();
    write.print("order cancelld \n credit amount :" + Amount + "\n Total Wallet balance :" + customerDetails.getWallet());
%>