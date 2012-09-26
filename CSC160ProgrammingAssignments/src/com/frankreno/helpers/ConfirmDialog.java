package com.frankreno.helpers;

import com.frankreno.helpers.ConfirmDialogImpl.ActionType;
import com.frankreno.helpers.ConfirmDialogImpl.ConfirmDialogType;

public interface ConfirmDialog {
	
	//get the message
	public String getOutputMessage();
	
	//get the title
	public String getDialogTitle();
	
	//get the type
	public ConfirmDialogType getDialogType();
	
	//get the action the user wants to take
	public ActionType getAction();
	
	
}
