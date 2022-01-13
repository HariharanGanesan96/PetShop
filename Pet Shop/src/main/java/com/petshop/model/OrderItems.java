package com.petshop.model;

import java.util.Objects;

public class OrderItems {
    private int itemId;
    private Orders orders =new Orders();
    private PetDetails pet=new PetDetails();
    private int quantity;
    private double unitPrice;
    private double totalPrice=unitPrice*quantity;
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public Orders getOrders() {
		return orders;
	}
	public void setOrders(Orders orders) {
		this.orders = orders;
	}
	public PetDetails getPet() {
		return pet;
	}
	public void setPet(PetDetails pet) {
		this.pet = pet;
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
		return "OrderItems [itemId=" + itemId + ", order=" + orders + ", petId=" + pet + ", quantity=" + quantity
				+ ", unitPrice=" + unitPrice + ", totalPrice=" + totalPrice + "]";
	}
	public OrderItems() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderItems(int itemId, int  orderId, int petId, int quantity, double unitPrice, double totalPrice) {
		super();
		this.itemId = itemId;
		this.orders.setOrderId(orderId);
		this.pet.setPetId(petId);
		this.quantity = quantity;
		this.unitPrice = unitPrice;
		this.totalPrice = totalPrice;
	}
		
}