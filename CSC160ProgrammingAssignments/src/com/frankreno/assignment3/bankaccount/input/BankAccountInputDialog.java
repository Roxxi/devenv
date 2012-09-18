package com.frankreno.assignment3.bankaccount.input;

import java.util.Map;

import com.frankreno.helpers.MultiInputDialog;
import com.frankreno.helpers.MultiInputDialogImpl;

public class BankAccountInputDialog extends MultiInputDialogImpl implements MultiInputDialog{
	
	private Map<String, Object> processedInput;
	
	static String TITLE = "Please Enter Account Information";
	static String[][] INPUTS = {{"Account Number: ", "10", "acctNum"},
								{"Account Type: ", "10", "acctType"},
								{"Minimum Balance: ", "10", "minBal"},
								{"Current Balance: ", "10", "curBal"}};		

	public BankAccountInputDialog() {
		super(TITLE, INPUTS);
		BankAccountInputProcessor processor = 
				new BankAccountInputProcessor(super.getRawInput());
		processedInput = processor.getProcessedInput();
	}
	
	public Map<String, Object> createProcessedInput(Map<String, String> rawInput) {
		return null;
	}

	public Map<String, Object> getProcessedInput() {
		return processedInput;
	}
	
	
}
