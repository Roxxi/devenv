package com.frankreno.assignment3;

import java.text.DecimalFormat;

public class BankAccountUtils {
	
	//returns true if curBal is below minVal
	public static boolean isBelowMinBal(double minBal, double curBal) {
		if (curBal < minBal) {
			return true;
		} else {
			return false;
		}
	}
	
	//format a double to 2 decimals with comma seperator
	public static String formatTwoDecimals(double amount) {
		DecimalFormat df = new DecimalFormat("###,###.00");
		return df.format(amount);
	}

}
