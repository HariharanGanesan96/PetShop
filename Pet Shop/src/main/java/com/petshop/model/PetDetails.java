package com.petshop.model;

import java.util.Date;
import java.util.Objects;

public class PetDetails {
	private int petId;
	private String petType;
	private String petName;
	private String petGender;
	private Date petDob;
	private int petQty;
	private String description;
	private String petColor;
	private double petprice;
	private String petImage;
	private String status;
	private Customers customer =new Customers();
	private Admin admin = new Admin();
	private Date regDate;
	private int avilableQty;
	public int getPetId() {
		return petId;
	}
	public void setPetId(int petId) {
		this.petId = petId;
	}
	public String getPetType() {
		return petType;
	}
	public void setPetType(String petType) {
		this.petType = petType;
	}
	public String getPetName() {
		return petName;
	}
	public void setPetName(String petName) {
		this.petName = petName;
	}
	public String getPetGender() {
		return petGender;
	}
	public void setPetGender(String petGender) {
		this.petGender = petGender;
	}
	public Date getPetDob() {
		return petDob;
	}
	public void setPetDob(Date petDob) {
		this.petDob = petDob;
	}
	public int getPetQty() {
		return petQty;
	}
	public void setPetQty(int petQty) {
		this.petQty = petQty;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPetColor() {
		return petColor;
	}
	public void setPetColor(String petColor) {
		this.petColor = petColor;
	}
	public double getPetprice() {
		return petprice;
	}
	public void setPetprice(double petprice) {
		this.petprice = petprice;
	}
	public String getPetImage() {
		return petImage;
	}
	public void setPetImage(String petImage) {
		this.petImage = petImage;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Customers getCustomer() {
		return customer;
	}
	public void setCustomer(Customers customer) {
		this.customer = customer;
	}
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getAvilableQty() {
		return avilableQty;
	}
	public void setAvilableQty(int avilableQty) {
		this.avilableQty = avilableQty;
	}
	@Override
	public String toString() {
		return "PetDetails [petId=" + petId + ", petType=" + petType + ", petName=" + petName + ", petGender="
				+ petGender + ", petDob=" + petDob + ", petQty=" + petQty + ", description=" + description
				+ ", petColor=" + petColor + ", petprice=" + petprice + ", petImage=" + petImage + ", status=" + status
				+ ", customer=" + customer + ", admin=" + admin + ", regDate=" + regDate + ", avilableQty="
				+ avilableQty + "]";
	}
	public PetDetails() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PetDetails(int petId, String petType, String petName, String petGender, Date petDob, int petQty,
			String description, String petColor, double petprice, String petImage, String status, int customerId,
			int adminId, Date regDate, int avilableQty) {
		super();
		this.petId = petId;
		this.petType = petType;
		this.petName = petName;
		this.petGender = petGender;
		this.petDob = petDob;
		this.petQty = petQty;
		this.description = description;
		this.petColor = petColor;
		this.petprice = petprice;
		this.petImage = petImage;
		this.status = status;
		this.customer.setCustomerId(customerId);
		this.admin.setAdminId(adminId);
		this.regDate = regDate;
		this.avilableQty = avilableQty;
	}
	
	

}
