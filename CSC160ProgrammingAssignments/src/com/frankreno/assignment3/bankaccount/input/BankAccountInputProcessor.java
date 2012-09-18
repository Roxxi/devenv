package com.frankreno.assignment3.bankaccount.input;

import java.util.HashMap;
import java.util.Map;

import com.frankreno.assignment3.bankaccount.BankAccountImpl.AccountType;
import com.frankreno.helpers.InputProcessor;

public class BankAccountInputProcessor implements InputProcessor {
	
	private Map<String, Object> processedInput;
	
	public BankAccountInputProcessor(Map<String, String> rawInput) {
		processedInput = processInput(rawInput);
	}
	
	//process raw input, converting Strings to appropriate data types
	private static Map<String, Object> processInput(Map<String, String> rawInput) {
		Map<String, Object> processedInput = new HashMap<String, Object>();
		
		int acctNum;
		double minBal, curBal;
		AccountType acctType;
		String rawAcctType;
		
		acctNum = Integer.parseInt(rawInput.get("acctNum"));
		rawAcctType = rawInput.get("acctType");
		acctType = lookupAccountType(rawAcctType);
		minBal = Double.parseDouble(rawInput.get("minBal"));
		curBal = Double.parseDouble(rawInput.get("curBal"));
		
		processedInput.put("acctNum", acctNum);
		processedInput.put("acctType", acctType);
		processedInput.put("minBal", minBal);
		processedInput.put("curBal", curBal);
		
		return processedInput;
	}
	
	//convert account type to id
	private static AccountType lookupAccountType(String rawAccountType) {
		String acctType = rawAccountType.toUpperCase();
		if (acctType.equals("C")) {
			return AccountType.CHECKING;
		} else if (acctType.equals("S")) {
			return AccountType.SAVINGS;
		} else {
			return null;
		}
	}

	//return the processed input
	public Map<String, Object> getProcessedInput() {
		return processedInput;
	}

}
