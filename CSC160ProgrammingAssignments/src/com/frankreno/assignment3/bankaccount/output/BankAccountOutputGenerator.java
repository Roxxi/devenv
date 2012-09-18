package com.frankreno.assignment3.bankaccount.output;
import com.frankreno.assignment3.bankaccount.BankAccount;
import com.frankreno.assignment3.bankaccount.BankAccountUtils;
import com.frankreno.assignment3.bankaccount.processor.BankAccountProcessor;
import com.frankreno.helpers.OutputGenerator;


public class BankAccountOutputGenerator implements OutputGenerator {

	String output;
	
	public BankAccountOutputGenerator(BankAccount account, BankAccountProcessor processor) {
		output = generateOutput(account, processor);
	}
	
	//generate the output
	private static String generateOutput(BankAccount bankAccount, BankAccountProcessor processor) {
		StringBuffer output = new StringBuffer();
		
		output.append("Account Number: ");
		output.append(bankAccount.getAccountNumber() + "\n");
		output.append("Account Type: ");
		output.append(bankAccount.getAccountType().toString() + "\n");
		output.append(processor.getResult());
		output.append("New Balance: $");
		output.append(BankAccountUtils.formatTwoDecimals(processor.getNewBalance()));
		
		return output.toString();
	}
	
	public String getOutput() {
		return output;
	}

}
