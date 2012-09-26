package com.frankreno.helpers;

import javax.swing.JOptionPane;

public class ConfirmDialogImpl implements ConfirmDialog {
	
	public enum ConfirmDialogType {
		YES, NO, YES_NO, YES_NO_CANCEL;
	}
	
	public enum ActionType {
		YES, NO
	}

	private ActionType action;
	private String outputMessage, dialogTitle;
	private ConfirmDialogType dialogType;
	
	public ConfirmDialogImpl(ConfirmDialogType type, String title, String output) {
		outputMessage = output;
		dialogTitle = title;
		dialogType = type;
		int rawAction = open();
		action = lookupActionType(rawAction);
	}
	
	//open the dialog based on based construction of object
	private int open() {
		int action = JOptionPane.showConfirmDialog(null, 
				outputMessage, 
				dialogTitle, 
				lookupDialogType(dialogType));
		return action;
	}
	
	private int lookupDialogType(ConfirmDialogType dialogType) {
		switch(dialogType) {
			case YES:
				return JOptionPane.YES_OPTION;
			case NO:
				return JOptionPane.NO_OPTION;
			case YES_NO:
				return JOptionPane.YES_NO_OPTION;
			case YES_NO_CANCEL:
				return JOptionPane.YES_NO_CANCEL_OPTION;
			default:
				return 0;
		}
	}
	
	private ActionType lookupActionType(int actionType) {
		switch (actionType) {
		case JOptionPane.YES_OPTION:
			return ActionType.YES;
		case JOptionPane.NO_OPTION:
			return ActionType.NO;
		default:
			return null;
		}
	}

	public String getOutputMessage() {
		return outputMessage;
	}
	
	public String getDialogTitle() {
		return dialogTitle;
	}
	
	public ConfirmDialogType getDialogType() {
		return dialogType;
	}
	
	public ActionType getAction() {
		return action;
	}

}
