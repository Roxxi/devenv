package com.frankreno.assignment4.dice;

public interface Dice {
	
	//roll the dice
	public void roll();
	
	//get the result of the first die
	public int getDie1();
	
	
	//get the result of the second die
	public int getDie2();
			
	//get the sum of both dies
	public int getRoll(); 
		
	//get the sum of both dies as a string output
	public String getRollResult(); 

}
