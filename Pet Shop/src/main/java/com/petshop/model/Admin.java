package com.petshop.model;

import java.sql.Date;


public class Admin {
    private int adminId;
    private String firstName;
    private String lastName;
    private String userName;
    private String password;
    private String email;
    private long number;
    private Date registerDate;
	public int getAdminId() {
		return adminId;
	}
	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public long getNumber() {
		return number;
	}
	public void setNumber(long number) {
		this.number = number;
	}
	public Date getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}
	@Override
	public String toString() {
		return "Admin [adminId=" + adminId + ",\n firstName=" + firstName + ",\n lastName=" + lastName + ",\n userName="
				+ userName + ",\n password=" + password + ",\n email=" + email + ",\n number=" + number + ",\n registerDate="
				+ registerDate + "]";
	}
	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Admin(int adminId, String firstName, String lastName, String userName, String password, String email,
			long number) {
		super();
		this.adminId = adminId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.userName = userName;
		this.password = password;
		this.email = email;
		this.number = number;
	}
	public Admin(int adminId, String firstName, String lastName, String userName, String password, String email,
			long number, Date registerDate) {
		super();
		this.adminId = adminId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.userName = userName;
		this.password = password;
		this.email = email;
		this.number = number;
		this.registerDate = registerDate;
	}
	
    
}