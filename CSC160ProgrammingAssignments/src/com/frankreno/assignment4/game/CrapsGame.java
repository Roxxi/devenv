package com.frankreno.assignment4.game;

import com.frankreno.assignment4.dice.StandardDice;

public class CrapsGame implements Game {
	
	public enum CrapsRollResult {
		WIN, LOOSE, POINT;
	}

	static String WELCOME_STRING = "Welcome to the game of craps!\n\n";
	static String LOOSE_STRING = "Sorry, you crapped out, you lose!\n";
	static String WIN_STRING = "Congratulations, you win!\n";
	static String POINT_START_STRING = "Your point is ";
	static String POINT_END_STRING = " ...good luck!\n";
	
	private boolean isFirstGame;
	private int point;
	private StandardDice dice;
	private String gameResult;
	
	//when the game is first constructed, indicate that it is the first game for appropriate output
	public CrapsGame() {
		isFirstGame = true;
		dice = new StandardDice();
	}

	public void play() {
		StringBuffer resultBuffer = new StringBuffer();
		
		if (isFirstGame) {
			resultBuffer.append(WELCOME_STRING);
		}
		
		CrapsRollResult result = firstRoll(resultBuffer);
		
		switch (result) {
		case WIN:
			resultBuffer.append(WIN_STRING);
			gameResult = resultBuffer.toString();
			isFirstGame = false;
			break;
		case LOOSE:
			resultBuffer.append(LOOSE_STRING);
			gameResult = resultBuffer.toString();
			isFirstGame = false;
			break;
		case POINT:
			point = dice.getRoll();
			while (result == CrapsRollResult.POINT) {
				resultBuffer.append(POINT_START_STRING + point + POINT_END_STRING);
				result = nextRoll(resultBuffer);
			}
			if (result == CrapsRollResult.WIN) {
				resultBuffer.append(WIN_STRING);
			} else {
				resultBuffer.append(LOOSE_STRING);
			}
			gameResult = resultBuffer.toString();
			isFirstGame = false;
			break;
		}
	}
	
	private CrapsRollResult firstRoll(StringBuffer resultBuffer) {	
		dice.roll();
		int roll = dice.getRoll();
		
		resultBuffer.append(dice.getRollResult() + "\n");
		
		if (roll == 7 || roll == 11) {
			return CrapsRollResult.WIN;
		} else if (roll == 2 || roll == 3 || roll == 12) {
			return CrapsRollResult.LOOSE;
		} else {
			return CrapsRollResult.POINT;
		}	
	}
	
	private CrapsRollResult nextRoll(StringBuffer resultBuffer) {
		dice.roll();
		int roll = dice.getRoll();
		
		resultBuffer.append(dice.getRollResult() + "\n");
		
		if (roll == point) {
			return CrapsRollResult.WIN;
		} else if (roll == 7) {
			return CrapsRollResult.LOOSE;
		} else {
			return CrapsRollResult.POINT;
		}
	}
	
	public String getGameResult() {
		return gameResult;
	}
}
