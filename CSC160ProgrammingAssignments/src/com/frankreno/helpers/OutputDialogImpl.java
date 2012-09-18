package com.frankreno.helpers;

import javax.swing.JOptionPane;

public class OutputDialogImpl implements OutputDialog {
	
	private int dialogType;
	private String outputMessage, dialogTitle;
	
	public OutputDialogImpl(int type, String title, String output) {
		outputMessage = output;
		dialogTitle = title;
		dialogType = type;
	}
	
	//open the dialog based on based construction of object
	public void open() {
		JOptionPane.showMessageDialog(null, 
				outputMessage, 
				dialogTitle, 
				dialogType);
	}
	
	public String getOutputMessage() {
		return outputMessage;
	}
	
	public String getDialogTitle() {
		return dialogTitle;
	}
	
	public int getDialogType() {
		return dialogType;
	}

}
