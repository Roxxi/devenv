package com.frankreno.assignment3.bankaccount.processor;

public interface AccountProcessor {
	
	//get the updated balance
	public double getNewBalance();
	
	//get the result from the transaction
	public String getResult();

}
