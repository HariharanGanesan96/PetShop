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
import com.petshop.daoimpl.CartItemsDAO;
import com.petshop.daoimpl.CustomerDAO;
import com.petshop.daoimpl.OrderItemsDAO;
import com.petshop.daoimpl.OrdersDAO;
import com.petshop.daoimpl.PetDAO;
import com.petshop.model.Admin;
import com.petshop.model.CartItems;
import com.petshop.model.Customers;
import com.petshop.model.OrderItems;
import com.petshop.model.Orders;
import com.petshop.model.PetDetails;

@WebServlet("/BuyCart")
public class BuyCart extends HttpServlet{
	
      @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    
    	  int itemId=Integer.parseInt(req.getParameter("itemId"));
    	   HttpSession session=req.getSession();
           PrintWriter write=resp.getWriter();
    	   CartItemsDAO cartDao=new CartItemsDAO();
    	   CartItems cartItems=cartDao.showCart(itemId);
    	   
    	   Customers customerDetails=(Customers)session.getAttribute("customer"); 
    	   Orders orders=new Orders();
    	   OrdersDAO ordersDao=new OrdersDAO();
    	   OrderItems orderItems=new OrderItems();
    	   OrderItemsDAO orderItemsDao=new OrderItemsDAO();
    	   PetDAO petDao=new PetDAO();
    	   
    	   PetDetails pet =petDao.showPet(cartItems.getPet().getPetId());
    	   CustomerDAO customerDao=new CustomerDAO();   
    	   Customers petCustomerDetails=customerDao.customerDetails(pet.getCustomer().getUserName());
    	   
    	   
    	   if(customerDetails.getWallet()>(cartItems.getTotalPrice())){  
    		   if(pet.getAvilableQty()>=cartItems.getQuantity()){	
    			   
    	   orders.getCustomer().setCustomerId(customerDetails.getCustomerId());
    	   orders.setTotalprice(cartItems.getTotalPrice());
    	   
    	   // insert values in orders
    	   ordersDao.insert(orders);
    	     
    	   int orderId=ordersDao.orderId();  
    	   orderItems.getOrders().setOrderId(orderId);
    	   orderItems.getPet().setPetId(pet.getPetId());
    	   orderItems.setQuantity(cartItems.getQuantity());
    	   orderItems.setUnitPrice(pet.getPetprice());
    	   orderItems.setTotalPrice(cartItems.getTotalPrice());
    	   
    	   // insert the values in order items
    	   orderItemsDao.insert(orderItems);
    	   
    	   //update pet available quantity
    	   pet.setAvilableQty((pet.getAvilableQty()-cartItems.getQuantity()));
    	   petDao.updatePetAviQty(pet);
    	   
    	   //update buyer wallet
    	   customerDetails.setWallet(customerDetails.getWallet()-cartItems.getTotalPrice());
    	   customerDao.updateWallet(customerDetails);
    	   
    	   //update seller wallet
    	   petCustomerDetails.setWallet(petCustomerDetails.getWallet()+cartItems.getQuantity());
    	   customerDao.updateWallet(petCustomerDetails);
    	   
    	   write.print("order placed sucussfully");
    	   }
    		   else{
    			   
    			   write.print("Quantity not avilable");
    		   }
    	   }
    	   
    	   else{
    		   write.print("low Wallet balance");
    	   }
    }
      
      @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	// TODO Auto-generated method stub
    	doGet(req, resp);
    }
}
