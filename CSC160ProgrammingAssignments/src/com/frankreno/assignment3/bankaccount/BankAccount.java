package com.frankreno.assignment3.bankaccount;

import com.frankreno.assignment3.bankaccount.BankAccountImpl.AccountType;

public interface BankAccount {
	
	//returns the minimum balance
	public double getMinimumBalance();

	//returns the current balance
	public double getCurrentBalance();
	
	//returns the interest rate
	public double getInterestRate();

	//returns the account number 
	public int getAccountNumber();
	
	//returns the service fee
	public int getServiceFee();
	
	//returns the account type
	public AccountType getAccountType();
	
	//returns true if the curBal is below minBal
	public boolean getIsBelowMinBal();

}
