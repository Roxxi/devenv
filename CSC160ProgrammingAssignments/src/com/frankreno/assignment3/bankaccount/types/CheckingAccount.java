package com.frankreno.assignment3.bankaccount.types;

import com.frankreno.assignment3.bankaccount.BankAccount;
import com.frankreno.assignment3.bankaccount.BankAccountImpl;
import com.frankreno.assignment3.bankaccount.BankAccountImpl.AccountType;
import com.frankreno.assignment3.bankaccount.BankAccountUtils;

public class CheckingAccount implements BankAccount {

	//constants for the checking account
	private static int INTEREST_RATE_CHANGE_VALUE = 5000;
	private static int SERVICE_FEE = 25;
	private static double PREMIUM_INTEREST_RATE = .05;
	private static double REGULAR_INTEREST_RATE = .03;
	
	private boolean belowMinBal;
	private double interestRate;
	private int serviceFee;
	private BankAccountImpl bankAccount;
	
	//use default interest rate and service fee
	public CheckingAccount(int acctNum, double minBal, double curBal) {
		bankAccount = new BankAccountImpl(acctNum, minBal, curBal);
		belowMinBal = BankAccountUtils.isBelowMinBal(minBal, curBal);
		interestRate = lookupInterestRate(minBal, curBal);
		serviceFee = SERVICE_FEE;
	}
	
	public CheckingAccount(int acctNum, double minBal, double curBal, double intRate) {
		bankAccount = new BankAccountImpl(acctNum, minBal, curBal);
		belowMinBal = BankAccountUtils.isBelowMinBal(minBal, curBal);
		interestRate = intRate;
		serviceFee = SERVICE_FEE;
	}
	
	public CheckingAccount(int acctNum, double minBal, double curBal, int svcFee) {
		bankAccount = new BankAccountImpl(acctNum, minBal, curBal);
		belowMinBal = BankAccountUtils.isBelowMinBal(minBal, curBal);
		interestRate = lookupInterestRate(minBal, curBal);;
		serviceFee = svcFee;
	}
	
	public CheckingAccount(int acctNum, double minBal, double curBal, double intRate, int svcFee) {
		bankAccount = new BankAccountImpl(acctNum, minBal, curBal);
		belowMinBal = BankAccountUtils.isBelowMinBal(minBal, curBal);
		interestRate = intRate;
		serviceFee = svcFee;
	}
	
	//lookup the interest rate
	private double lookupInterestRate(double minBal, double curBal) {
		double difference = curBal - minBal;
		if (difference >= INTEREST_RATE_CHANGE_VALUE) {
			return PREMIUM_INTEREST_RATE;
		} else if (difference < 0) {
			return 0; //no interest earned
		} else {
			return REGULAR_INTEREST_RATE;
		}
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
		return AccountType.CHECKING;
	}


}
