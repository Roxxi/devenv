package com.frankreno.assignment3;

@SuppressWarnings("serial")
public class NullAccountTypeException extends Exception {

	static String MESSAGE = "Account Type could not resolved!";
	
	public NullAccountTypeException() {
		super(MESSAGE);
	}

	public String toString(){
		   return "NullAccountTypeException["+MESSAGE+"]";
	   }  
}
