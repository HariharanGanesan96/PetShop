package com.petshop.model;

import java.sql.Date;
import java.util.Objects;

public class Orders {
	
	private int orderId;
	private Customers customer = new Customers();
	private double Totalprice;
	private String orderStatus;
	private Date orderDate;
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public Customers getCustomer() {
		return customer;
	}
	public void setCustomer(Customers customer) {
		this.customer = customer;
	}
	public double getTotalprice() {
		return Totalprice;
	}
	public void setTotalprice(double totalprice) {
		Totalprice = totalprice;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	@Override
	public String toString() {
		return "Orders [orderId=" + orderId + ", customer=" + customer + ", Totalprice=" + Totalprice + ", orderStatus="
				+ orderStatus + ", orderDate=" + orderDate + "]";
	}
	public Orders() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Orders(int orderId, Customers customer, double totalprice, String orderStatus, Date orderDate) {
		super();
		this.orderId = orderId;
		this.customer = customer;
		Totalprice = totalprice;
		this.orderStatus = orderStatus;
		this.orderDate = orderDate;
	}
		
}
