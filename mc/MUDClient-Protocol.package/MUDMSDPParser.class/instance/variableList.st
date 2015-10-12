accessing
variableList 
	^ var, varName, val, array 
		==> [ :nodes |
			MUDMSDPList new 
				variable: nodes second; 
				list: nodes fourth;
				yourself ]