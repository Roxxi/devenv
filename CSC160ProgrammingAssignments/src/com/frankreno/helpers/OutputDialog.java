package com.frankreno.helpers;

public interface OutputDialog {

	//open the dialog
	public void open();
	
	//get the message
	public String getOutputMessage();
	
	//get the title
	public String getDialogTitle();
	
	//get the type
	public int getDialogType();
	
}
