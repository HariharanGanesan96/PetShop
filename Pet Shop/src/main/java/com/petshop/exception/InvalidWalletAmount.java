package com.petshop.exception;

public class InvalidWalletAmount extends Exception {
	
	String message="Invalid Amount";
    
	@Override
	public String toString() {
		return message;
	}

}
