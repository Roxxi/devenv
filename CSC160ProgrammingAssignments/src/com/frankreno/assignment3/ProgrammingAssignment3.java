package com.frankreno.assignment3;

import java.util.Map;

import com.frankreno.assignment3.AccountProcessorImpl.TransactionType;

/**
 * @author frankreno
 * @date Sep 11, 2012
 * @version 1.0
 * @description
 *
 */
public class ProgrammingAssignment3 {
	
	static String NULL_ACCOUNT_TYPE_ERROR = 
			"You have entered an invalid Account Type. " +
			"Please ensure you enter \"C\" or \"c\" for a checking account " +
			"or \"S\" or \"s\" for a savings account.";
	static String INVALID_INPUT_ERROR = "You have entered invalid input. " +
			"Please check your input and try again";
	
	/*
	 * 1) create the input dialog
	 * 2) get the processed input
	 * 3) create an account and processor
	 * 4) create an output generator
	 * 5) display the output
	 */
	public static void main(String[] args) {
		BankAccountInputDialog iDialog = new BankAccountInputDialog();
		try {
			if (iDialog.getAction() == InputDialogAction.OK) {
				Map<String, Object> processedInput = iDialog.getProcessedInput();
				BankAccount bankAccount = createBankAccount(processedInput);
				AccountProcessor processor = createAccountProcessor(bankAccount);
				BankAccountOutputGenerator oGenerator = 
						new BankAccountOutputGenerator(bankAccount, processor);
				BankAccountOutputDialog oDialog =
						new BankAccountOutputDialog(oGenerator.getOutput());
			}
		} catch (NullAccountTypeException e) { //invalid account type
			ErrorDialog oDialog = new ErrorDialog(NULL_ACCOUNT_TYPE_ERROR);
		} catch (NumberFormatException e) { //invalid input
			ErrorDialog oDialog = new ErrorDialog(INVALID_INPUT_ERROR);
		}

		System.exit(0);
	}
	
	//construct the appropriate bank account
	private static BankAccount createBankAccount(Map<String, Object> processedInput) 
			throws NullAccountTypeException {
		BankAccount bankAccount;
		int acctType, acctNum;
		double minBal, curBal;

		acctNum = (Integer) processedInput.get("acctNum");
		acctType = (Integer) processedInput.get("acctType");
		minBal = (Double) processedInput.get("minBal");
		curBal = (Double) processedInput.get("curBal");

		switch (acctType) {
			case 1:
				bankAccount = new CheckingAccount(acctNum, minBal, curBal);
				return bankAccount;
			case 2:
				bankAccount = new SavingsAccount(acctNum, minBal, curBal);
				return bankAccount;
			default:
				throw new NullAccountTypeException(); //account type must exist
		}
	}
	
	//construct the account processor to process the account
	private static AccountProcessor createAccountProcessor(BankAccount bankAccount) {
		AccountProcessor processor ;
		if (bankAccount.getIsBelowMinBal()) {
			processor = new AccountProcessorImpl(
					TransactionType.APPLY_SERVICE_FEE, bankAccount);
		} else {
			processor = new AccountProcessorImpl(
					TransactionType.APPLY_INTEREST, bankAccount);
		}
		
		return processor;
	}
	

	
}