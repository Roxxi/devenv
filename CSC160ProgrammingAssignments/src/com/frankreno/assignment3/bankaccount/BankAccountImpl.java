package com.frankreno.assignment3.bankaccount;

public class BankAccountImpl {

	//define the possible account types
	public enum AccountType {
		CHECKING, SAVINGS;
		
		@Override
		public String toString() {
			switch (this) {
				case CHECKING: return "Checking";
				case SAVINGS: return "Savings";
				default: return "UNKNOWN"; 
			}
		}
	}
	
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
