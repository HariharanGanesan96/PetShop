package com.petshop.model;



public class CartItems {
	private int itemId;
	private PetDetails pet =new PetDetails();
	private Customers customer=new Customers();
	private int quantity;
	private double unitPrice;
	private double totalPrice;
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public PetDetails getPet() {
		return pet;
	}
	public void setPet(PetDetails pet) {
		this.pet = pet;
	}
	public Customers getCustomer() {
		return customer;
	}
	public void setCustomer(Customers customer) {
		this.customer = customer;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	@Override
	public String toString() {
		return "CartItems [itemId=" + itemId + ", pet=" + pet + ", customer=" + customer + ", quantity=" + quantity
				+ ", unitPrice=" + unitPrice + ", totalPrice=" + totalPrice + "]";
	}
	public CartItems() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CartItems(int itemId, int petId,int customerId, int quantity, double unitPrice,
			double totalPrice) {
		super();
		this.itemId = itemId;
		this.pet.setPetId(petId);
		this.customer.setCustomerId(customerId);
		this.quantity = quantity;
		this.unitPrice = unitPrice;
		this.totalPrice = totalPrice;
	}
}
