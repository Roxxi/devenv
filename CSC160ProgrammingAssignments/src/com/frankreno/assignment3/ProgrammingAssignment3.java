package com.frankreno.assignment3;

import java.util.HashMap;
import java.util.Map;

import javax.swing.JOptionPane;

import com.frankreno.helpers.AccountProcessor;
import com.frankreno.helpers.AccountProcessorImpl;
import com.frankreno.helpers.BankAccount;
import com.frankreno.helpers.BankAccountUtils;
import com.frankreno.helpers.CheckingAccount;
import com.frankreno.helpers.MultiInputDialogImpl;
import com.frankreno.helpers.NullAccountTypeException;
import com.frankreno.helpers.OutputDialog;
import com.frankreno.helpers.OutputDialogImpl;
import com.frankreno.helpers.SavingsAccount;

/**
 * @author frankreno
 * @date Sep 11, 2012
 * @version 1.0
 * @description
 *
 */
public class ProgrammingAssignment3 {
	
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
	
	//define the possible transaction types
	public enum TransactionType {
		APPLY_INTEREST, APPLY_SERVICE_FEE;
	}
	
	//constants for the input dialog
	static int ROWS = 0;
	static int COLUMNS = 2;
	static int INPUT_SIZE = 10;
	static String DIALOG_TITLE = "Please Enter Account Information";
	static String[][] INPUTS = {{"Account Number: ", "10", "acctNum"},
								{"Account Type: ", "10", "acctType"},
								{"Minimum Balance: ", "10", "minBal"},
								{"Current Balance: ", "10", "curBal"}};		
	
	//strings for the output
	static String OUTPUT_TITLE = "Account Summary";
	
	//strings for the errors
	static String ERROR = "ERROR";
	static String NULL_ACCOUNT_TYPE_ERROR = 
			"You have entered an invalid Account Type. " +
			"Please ensure you enter \"C\" or \"c\" for a checking account " +
			"or \"S\" or \"s\" for a savings account.";
	static String INVALID_INPUT_ERROR = "You have entered invalid input. " +
			"Please check your input and try again";
	
	
	/*
	 * 1) create and open the input dialog
	 * 2) if the user presses OK, read and process the input
	 * 3) create a bank account
	 * 4) create an account processor
	 * 5) generate the output in a dialog
	 */
	public static void main(String[] args) {
		MultiInputDialogImpl inputDialog = new MultiInputDialogImpl(DIALOG_TITLE, INPUTS);
		int action = inputDialog.open();
		OutputDialog outputDialog = null;
		try {
			if (action == JOptionPane.OK_OPTION) {
				Map<String, String> rawInput = inputDialog.getInput();
				Map<String, Object> processedInput = processInput(rawInput);
				BankAccount bankAccount = createBankAccount(processedInput);
				AccountProcessor processor = createAccountProcessor(bankAccount);
				String output = generateOutput(bankAccount, processor);
				outputDialog = new OutputDialogImpl(
						JOptionPane.INFORMATION_MESSAGE, OUTPUT_TITLE, output);		
			}
		} catch (NullAccountTypeException e) { //invalid account type
			outputDialog = new OutputDialogImpl(
					JOptionPane.ERROR_MESSAGE, ERROR, NULL_ACCOUNT_TYPE_ERROR);
		} catch (NumberFormatException e) { //invalid input
			outputDialog = new OutputDialogImpl(
					JOptionPane.ERROR_MESSAGE, ERROR, INVALID_INPUT_ERROR);
		}
		if (outputDialog != null) {
			outputDialog.open();
		}
		
		System.exit(0);
	}
	
	//process raw input, converting Strings to appropriate data types
	private static Map<String, Object> processInput(Map<String, String> rawInput) {
		Map<String, Object> processedInput = new HashMap<String, Object>();
		
		int acctNum, acctType;
		double minBal, curBal;
		String rawAcctType;
		
		acctNum = Integer.parseInt(rawInput.get(INPUTS[0][2]));
		rawAcctType = rawInput.get(INPUTS[1][2]);
		acctType = lookupAccountType(rawAcctType);
		minBal = Double.parseDouble(rawInput.get(INPUTS[2][2]));
		curBal = Double.parseDouble(rawInput.get(INPUTS[3][2]));
		
		processedInput.put(INPUTS[0][2], acctNum);
		processedInput.put(INPUTS[1][2], acctType);
		processedInput.put(INPUTS[2][2], minBal);
		processedInput.put(INPUTS[3][2], curBal);
		
		return processedInput;
	}
	
	//convert account type to id
	private static int lookupAccountType(String rawAccountType) {
		String acctType = rawAccountType.toUpperCase();
		if (acctType.equals("C")) {
			return 1;
		} else if (acctType.equals("S")) {
			return 2;
		} else {
			return 0;
		}
	}
	
	//construct the appropriate bank account
	private static BankAccount createBankAccount(Map<String, Object> processedInput) 
			throws NullAccountTypeException {
		
		BankAccount bankAccount;
		int acctType, acctNum;
		double minBal, curBal;

		acctNum = (Integer) processedInput.get(INPUTS[0][2]);
		acctType = (Integer) processedInput.get(INPUTS[1][2]);
		minBal = (Double) processedInput.get(INPUTS[2][2]);
		curBal = (Double) processedInput.get(INPUTS[3][2]);

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
	
	//generate the output
	private static String generateOutput(BankAccount bankAccount, AccountProcessor processor) {
		StringBuffer output = new StringBuffer();
		
		output.append(INPUTS[0][0]);
		output.append(bankAccount.getAccountNumber() + "\n");
		output.append(INPUTS[1][0]);
		output.append(bankAccount.getAccountType().toString() + "\n");
		output.append(processor.getResult());
		output.append(INPUTS[3][0] + "$");
		output.append(BankAccountUtils.formatTwoDecimals(processor.getNewBalance()));
		
		return output.toString();
	}
	
}
