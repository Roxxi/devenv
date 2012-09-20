package com.frankreno.assignment3.bankaccount.processor;

import com.frankreno.assignment3.bankaccount.BankAccount;
import com.frankreno.assignment3.bankaccount.BankAccountUtils;

public class BankAccountProcessorImpl implements BankAccountProcessor {
	
	//define the possible transaction types
	public enum TransactionType {
		APPLY_INTEREST, APPLY_SERVICE_FEE;
	}
	
	//strings for result
	static String INTEREST_RATE_START = "You have earned ";
	static String INTEREST_RATE_END = "% interest on your account.\n";
	static String CURRENT_BALANCE_START = "Your current balance has fallen below " +
			"the necessary minimum balance of $";
	static String CURRENT_BALANCE_END = ".\n";
	static String SERVICE_FEE_START = "You will be charged a $";
	static String SERVICE_FEE_END = " service fee.\n";
	
	private double newBalance;
	private String result;
	
	public BankAccountProcessorImpl(TransactionType transaction, BankAccount account) {
		switch (transaction) {
		case APPLY_INTEREST:
			applyInterest(account);
			break;
		case APPLY_SERVICE_FEE:
			applyServiceFee(account);
			break;
		default:
			break;
			
		}
	}
	
	private void applyInterest(BankAccount account) {
		newBalance = (1 + account.getInterestRate()) * account.getCurrentBalance();
		result = generateApplyInterestResult(account, newBalance);
	}
	
	private String generateApplyInterestResult(BankAccount account, double newBalance) {
		StringBuffer result = new StringBuffer();
		
		result.append(INTEREST_RATE_START);
		result.append(BankAccountUtils.formatTwoDecimals(account.getInterestRate() * 100));
		result.append(INTEREST_RATE_END);
		
		return result.toString();
	}

	private void applyServiceFee(BankAccount account) {
		newBalance = account.getCurrentBalance() - account.getServiceFee();
		result = generateApplyServiceFeeResult(account);
	}
	
	private String generateApplyServiceFeeResult(BankAccount account) {
		StringBuffer result = new StringBuffer();
		
		result.append(CURRENT_BALANCE_START);
		result.append(BankAccountUtils.formatTwoDecimals(account.getMinimumBalance()));
		result.append(CURRENT_BALANCE_END);
		result.append(SERVICE_FEE_START);
		result.append(BankAccountUtils.formatTwoDecimals(account.getServiceFee()));
		result.append(SERVICE_FEE_END);
		
		return result.toString();
	}

	public double getNewBalance() {
		return newBalance;
	}
	
	public String getResult() {
		return result;
	}

}
