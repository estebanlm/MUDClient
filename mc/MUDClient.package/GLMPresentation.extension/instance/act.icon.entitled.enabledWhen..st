*MUDClient
act: aBlock icon: anIcon entitled: aString enabledWhen: conditionBlock
	self 
		addAction: 
			(MUDAction new 
				action: aBlock; 
				icon: anIcon;
				title: aString; 
				enabledCondition: conditionBlock;
				yourself)