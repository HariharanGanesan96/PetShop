package com.petshop.exception;

public class LowWalletBalance extends Exception {
	
	String message="Low wallet balance";
    
	@Override
	public String toString() {
		return message;
	}

}
