package com.frankreno.helpers;

import javax.swing.JOptionPane;

public class OutputDialogImpl implements OutputDialog {
	
	public enum OutputDialogType {
		ERROR, RESULT;
	}
	
	private String outputMessage, dialogTitle;
	private OutputDialogType dialogType;
	
	public OutputDialogImpl(OutputDialogType type, String title, String output) {
		outputMessage = output;
		dialogTitle = title;
		dialogType = type;
		open();
	}
	
	//open the dialog based on based construction of object
	private void open() {
		JOptionPane.showMessageDialog(null, 
				outputMessage, 
				dialogTitle, 
				lookupDialogType(dialogType));
	}
	
	private int lookupDialogType(OutputDialogType dialogType) {
		switch(dialogType) {
			case ERROR:
				return JOptionPane.ERROR_MESSAGE;
			case RESULT:
				return JOptionPane.INFORMATION_MESSAGE;
			default:
				return 0;
		}
	}

	public String getOutputMessage() {
		return outputMessage;
	}
	
	public String getDialogTitle() {
		return dialogTitle;
	}
	
	public OutputDialogType getDialogType() {
		return dialogType;
	}

}
