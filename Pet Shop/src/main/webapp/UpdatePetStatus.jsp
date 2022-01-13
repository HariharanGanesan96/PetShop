<%@page import="java.io.PrintWriter"%>
<%@page import="com.petshop.daoimpl.PetDAO"%>
<%@page import="com.petshop.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
  int petId=Integer.parseInt(request.getParameter("petId"));
  System.out.print("petId admin"+petId);
  
  String status=request.getParameter("status");  
  Admin admin=(Admin) session.getAttribute("Admin");
  PetDAO petDao=new PetDAO();
  petDao.updateStatus(petId,status, admin.getAdminId());
  PrintWriter write=response.getWriter();
  write.print("Status Updated");
  %>
  