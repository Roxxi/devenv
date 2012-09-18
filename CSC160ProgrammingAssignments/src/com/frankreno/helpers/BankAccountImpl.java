package com.frankreno.helpers;

public class BankAccountImpl {

	private double minimumBalance, currentBalance;
	private int accountNumber;
	
	//the bank account implementation
	public BankAccountImpl(int acctNum, double minBal, double curBal) {
		accountNumber = acctNum;
		minimumBalance = minBal;
		currentBalance = curBal;
	}
	
	//define the getters
	public double getMinimumBalance() {
		return minimumBalance;
	}

	public double getCurrentBalance() {
		return currentBalance;
	}

	public int getAccountNumber() {
		return accountNumber;
	}

}
