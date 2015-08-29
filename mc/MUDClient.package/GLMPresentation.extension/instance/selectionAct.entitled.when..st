*MUDClient
selectionAct: aBlock entitled: aString when: conditionBlock
	self 
		addSelectionAction: 
			((GLMGenericAction new) 
				action: aBlock; 
				title: aString; 
				condition: conditionBlock;
				yourself)