package com.frankreno.helpers;

import java.awt.GridLayout;
import java.util.Map;

import javax.swing.JPanel;

public interface MultiInputDialog {
	
	//opens the dialog
	public int open();
	
	//returns the input
	public Map<String, String> getInput();
	
	//returns the number of rows in the dialog
	public int getRows();
	
	//returns the number of cols in the dialog
	public int getCols();

	//returns the GridLayout object in the dialog
	public GridLayout getGridLayout();

	//returns the JPanel object in the dialog
	public JPanel getPanel();
	
	//returns the title of the dialog
	public String getTitle();
	
	//returns the inputs of the dialog
	//each row represents one input
	//each array in the row stores the input label, size and name
	public String[][] getInputs();

}
