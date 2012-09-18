package com.frankreno.assignment3.bankaccount.types;

import com.frankreno.assignment3.ProgrammingAssignment3.AccountType;
import com.frankreno.assignment3.bankaccount.BankAccount;
import com.frankreno.assignment3.bankaccount.BankAccountImpl;
import com.frankreno.assignment3.bankaccount.BankAccountUtils;

public class SavingsAccount implements BankAccount {
	
	//constants for the savings account
	private static int SERVICE_FEE = 10;
	private static double INTEREST_RATE = .04;
	
	private boolean belowMinBal;
	private double interestRate;
	private int serviceFee;
	private BankAccountImpl bankAccount;
	
	//use default interest rate and service fee
	public SavingsAccount(int acctNum, double minBal, double curBal) {
		bankAccount = new BankAccountImpl(acctNum, minBal, curBal);
		belowMinBal = BankAccountUtils.isBelowMinBal(minBal, curBal);
		interestRate = INTEREST_RATE;
		serviceFee = SERVICE_FEE;
	}
	
	public SavingsAccount(int acctNum, double minBal, double curBal, double intRate) {
		bankAccount = new BankAccountImpl(acctNum, minBal, curBal);
		belowMinBal = BankAccountUtils.isBelowMinBal(minBal, curBal);
		interestRate = intRate;
		serviceFee = SERVICE_FEE;
	}
	
	public SavingsAccount(int acctNum, double minBal, double curBal, int svcFee) {
		bankAccount = new BankAccountImpl(acctNum, minBal, curBal);
		belowMinBal = BankAccountUtils.isBelowMinBal(minBal, curBal);
		interestRate = INTEREST_RATE;
		serviceFee = svcFee;
	}
	
	public SavingsAccount(int acctNum, double minBal, double curBal, double intRate, int svcFee) {
		bankAccount = new BankAccountImpl(acctNum, minBal, curBal);
		belowMinBal = BankAccountUtils.isBelowMinBal(minBal, curBal);
		interestRate = intRate;
		serviceFee = svcFee;
	}
	
	//define the getters
	public boolean getIsBelowMinBal() {
		return belowMinBal;
	}
	
	public int getAccountNumber() {
		return bankAccount.getAccountNumber();
	}
	
	public double getMinimumBalance() {
		return bankAccount.getMinimumBalance();
	}
	
	public double getCurrentBalance() {
		return bankAccount.getCurrentBalance();
	}
	
	public double getInterestRate() {
		return interestRate;
	}

	public int getServiceFee() {
		return serviceFee;
	}

	public AccountType getAccountType() {
		return AccountType.SAVINGS;
	}

}
