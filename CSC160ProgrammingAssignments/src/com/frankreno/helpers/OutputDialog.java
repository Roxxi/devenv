package com.frankreno.helpers;

import com.frankreno.helpers.OutputDialogImpl.OutputDialogType;

public interface OutputDialog {
	
	//get the message
	public String getOutputMessage();
	
	//get the title
	public String getDialogTitle();
	
	//get the type
	public OutputDialogType getDialogType();
	
}
