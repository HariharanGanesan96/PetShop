package com.petshop.dao;

import java.util.List;

import com.petshop.model.Customers;

public interface CustomerInterface {

	public void insert(Customers cus);
	
	public void update(Customers customer);
	
	public void delete(Customers customer,String status);
	
	public String cusValidation(Customers cus);
	
	public boolean ValidatUsername(Customers customer);
	
	public boolean ValidateEmail(Customers customer);
	
	public List<Customers> showCustomerList();
	
	public Customers customerDetails(String userName);
	
	public Customers customerDetails(int customerId);
	
	public void updateImage(Customers cus);
	
	public void updateWallet(Customers cus);
	
	
	
	
}
