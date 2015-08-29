*MUDClient
selectionAct: aBlock entitled: aString enabledWhen: conditionBlock
	self 
		addSelectionAction: 
			(MUDAction new
				action: aBlock; 
				title: aString; 
				enabledCondition: conditionBlock;
				yourself)