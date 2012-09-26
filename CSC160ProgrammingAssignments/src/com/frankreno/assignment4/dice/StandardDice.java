package com.frankreno.assignment4.dice;

public class StandardDice implements Dice {
	
	//a standard die has 6 sides
	static int NUM_SIDES = 6;
	
	private int die1;
	private int die2;
	private int roll;

	public StandardDice() {
	}
	
	//generate the numbers randomly, simulates rolling the dice
	public void roll() {
		die1 = (int) (Math.random() * NUM_SIDES + 1);
		die2 = (int) (Math.random() * NUM_SIDES + 1);
		roll = die1 + die2;
	}
	
	public int getDie1() {
		return die1;
	}
	
	public int getDie2() {
		return die2;
	}
	
	public int getRoll() {
		return roll;
	}
	
	public String getRollResult() {
		return "You rolled a " + die1 + " and a " + die2 + " which is " + roll;
	}


}
