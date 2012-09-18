package com.frankreno.helpers;


public class ErrorDialog extends OutputDialogImpl implements OutputDialog {
	
	static OutputDialogType TYPE = OutputDialogType.ERROR;
	static String TITLE = "ERROR";

	public ErrorDialog(String output) {
		super(TYPE, TITLE, output);
	}

}
