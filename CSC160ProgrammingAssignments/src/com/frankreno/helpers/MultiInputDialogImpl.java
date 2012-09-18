package com.frankreno.helpers;

import java.awt.Component;
import java.awt.GridLayout;
import java.util.HashMap;
import java.util.Map;

import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class MultiInputDialogImpl {
	
	//define the possible actions the dialog could take
	public enum InputDialogAction {
		OK, CANCEL;
	}
	
	//constants to define grid layout
	static int ROWS = 0;
	static int COLUMNS = 2;
	
	private int rows, cols;
	private GridLayout gridLayout;
	private InputDialogAction action;
	private JPanel panel;
	private Map<String, String> rawInput;
	private String title;
	private String[][] inputs;
	
	//construct using defaults
	public MultiInputDialogImpl(String dialogTitle, String[][] dialogInputs) {
		rows = ROWS;
		cols = COLUMNS;
		title = dialogTitle;
		inputs = dialogInputs;
		gridLayout = new GridLayout(rows, cols);
		panel = createPanel(gridLayout, inputs);
		int rawAction = open();
		action = lookupAction(rawAction);
		rawInput = createRawInput();
	}

	//construct by specifying rows/columns
	public MultiInputDialogImpl(String dialogTitle, String[][] dialogInputs, int numRows, int numCols) {
		rows = numRows;
		cols = numCols;
		title = dialogTitle;
		inputs = dialogInputs;
		gridLayout = new GridLayout(rows, cols);
		panel = createPanel(gridLayout, inputs);
		int rawAction = open();
		action = lookupAction(rawAction);
		rawInput = createRawInput();
	}
	
	//create the panel
	private JPanel createPanel(GridLayout layout, String[][] inputs) {
		JPanel panel = new JPanel();
		panel.setLayout(layout);
		
		for (int i = 0; i < inputs.length; i++) {
			JLabel label = new JLabel(inputs[i][0]);
			JTextField field = new JTextField(Integer.parseInt(inputs[i][1]));
			field.setName(inputs[i][2]);
			panel.add(label);
			panel.add(field);
		}
		
		return panel;
	}
	
	//open the dialog, returns int to capture selection
	private int open() {		
		int action = JOptionPane.showConfirmDialog(null, 
				panel, 
				title, 
				JOptionPane.OK_CANCEL_OPTION);
		
		return action;
	}
	
	private Map<String, String> createRawInput() {
		Map<String, String> input = new HashMap<String, String>();
		
		Component[] components = panel.getComponents();

		//loop thru the panel and get the text field values
		for (Component c : components) {
			for (int i = 0; i < inputs.length; i++) {
				if (c.getName() != null && c.getName().equals(inputs[i][2])) {
					String value = ((JTextField) c).getText();
					input.put(inputs[i][2], value);
				}
			}
		}
		return input;
	}
	
	private InputDialogAction lookupAction(int rawAction) {
		switch(rawAction) {
			case JOptionPane.OK_OPTION:
				return InputDialogAction.OK;
			case JOptionPane.CANCEL_OPTION:
				return InputDialogAction.CANCEL;
			default:
				return null;
		}
	}

	
	public int getRows() {
		return rows;
	}
	
	public int getCols() {
		return cols;
	}

	public GridLayout getGridLayout() {
		return gridLayout;
	}

	public JPanel getPanel() {
		return panel;
	}
	
	public String getTitle() {
		return title;
	}
	
	public String[][] getInputs() {
		return inputs;
	}
	
	public Map<String, String> getRawInput() {
		return rawInput;
	}
	
	public InputDialogAction getAction() {
		return action;
	}
}
