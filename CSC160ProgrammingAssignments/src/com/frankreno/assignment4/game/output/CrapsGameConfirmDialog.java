package com.frankreno.assignment4.game.output;

import com.frankreno.helpers.ConfirmDialog;
import com.frankreno.helpers.ConfirmDialogImpl;

public class CrapsGameConfirmDialog extends ConfirmDialogImpl implements
		ConfirmDialog {
	
	static ConfirmDialogType TYPE = ConfirmDialogType.YES_NO;
	static String TITLE = "Would you like to play again?";
	
	public CrapsGameConfirmDialog(String output) {
		super(TYPE, TITLE, output);
	}

}
