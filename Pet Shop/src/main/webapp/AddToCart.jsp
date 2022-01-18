<%@page import="com.petshop.exception.QuantityNotAvalilable"%>
<%@page import="oracle.jdbc.driver.json.JsonpGeneratorWrapper"%>
<%@page import="com.petshop.exception.ItemAlreadyInCart"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.petshop.daoimpl.CartItemsDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.petshop.daoimpl.PetDAO"%>
<%@page import="java.util.*"%>
<%@page import="com.petshop.model.*"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%
  
    boolean available=true;

    PrintWriter out1=response.getWriter();
    CartItemsDAO cartItemDao=new CartItemsDAO();
    
    Customers customerDetails=(Customers)session.getAttribute("customer");
    
    PetDetails pet=(PetDetails)session.getAttribute("pet");
    
    List<CartItems> cartList=new ArrayList<CartItems>();
    
    cartList=cartItemDao.showAllCartItems(customerDetails);
    
    PrintWriter write=response.getWriter();
    int quantity=Integer.parseInt(request.getParameter("quantity"));  
    
    if(quantity<=pet.getAvilableQty()){
    for(CartItems cartitems:cartList){
    	if(cartitems.getPet().getPetId()==pet.getPetId()){
    		try{
    		throw new ItemAlreadyInCart();
    		}
    		catch(ItemAlreadyInCart e){
    			
    			write.print(e);
    		}
    		available=false;  		
    		break;
    	}
    }
    
   if(available){
        
    CartItems cart=new CartItems();
    
    cart.getPet().setPetId(pet.getPetId());
    cart.getCustomer().setCustomerId(customerDetails.getCustomerId());
    cart.setQuantity(quantity);
    cart.setUnitPrice(pet.getPetprice());
    cart.setTotalPrice(quantity*pet.getPetprice());
    
    
    CartItemsDAO cartItemsDao=new CartItemsDAO();
    cartItemsDao.insertCartItem(cart);
    write.print("item add to cart");
   }
    }
    else{
    	try{
    		throw new QuantityNotAvalilable();
    	}
    	catch(QuantityNotAvalilable e){
    		write.print(e+"\n\n Available Pet Quantity : "+pet.getAvilableQty());
    	}
    }
%>

