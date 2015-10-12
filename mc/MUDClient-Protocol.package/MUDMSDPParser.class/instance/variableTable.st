accessing
variableTable
	^ var, varName, val, table 
		==> [ :nodes |
			MUDMSDPMap new 
				variable: nodes second; 
				map: nodes fourth;
				yourself ]