package com.frankreno.assignment3.bankaccount.output;

import com.frankreno.helpers.OutputDialog;
import com.frankreno.helpers.OutputDialogImpl;

public class BankAccountOutputDialog extends OutputDialogImpl implements
		OutputDialog {
	
	static OutputDialogType TYPE = OutputDialogType.RESULT;
	static String TITLE = "Account Summary";
	
	public BankAccountOutputDialog(String output) {
		super(TYPE, TITLE, output);
	}

}
