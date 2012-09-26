package com.frankreno.assignment4;

import com.frankreno.assignment4.game.CrapsGame;
import com.frankreno.assignment4.game.Game;
import com.frankreno.assignment4.game.output.CrapsGameConfirmDialog;
import com.frankreno.helpers.ConfirmDialog;
import com.frankreno.helpers.ConfirmDialogImpl.ActionType;

public class ProgrammingAssignment4 {	
	
	/*
	 * 1) create the craps game
	 * 2) play the game
	 * 3) continue to play the game as long as the user selects Yes
	 */
	public static void main(String[] args) {
		
		Game craps = new CrapsGame();
	
		craps.play();
		
		ConfirmDialog oDialog = new CrapsGameConfirmDialog(craps.getGameResult());
		
		while (oDialog.getAction() == ActionType.YES){
			craps.play();
			oDialog = new CrapsGameConfirmDialog(craps.getGameResult());
		}
		
		System.exit(0);
		
	}
	

}
