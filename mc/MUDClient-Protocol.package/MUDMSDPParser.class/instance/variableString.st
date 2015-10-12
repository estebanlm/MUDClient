accessing
variableString
	^ var, varName, val, string 
		==> [ :nodes |
			MUDMSDPValue new 
				variable: nodes second; 
				value: nodes fourth;
				yourself ]