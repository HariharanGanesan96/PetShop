package com.petshop.exception;

public class LowWalletBalance extends Exception {
	
	String message="Low wallet balance please add amount ";
    
	@Override
	public String toString() {
		return message;
	}

}
