*RpgClient
selectionAct: aBlock entitled: aString enabledWhen: conditionBlock
	self 
		addSelectionAction: 
			(RpcAction new
				action: aBlock; 
				title: aString; 
				enabledCondition: conditionBlock;
				yourself)