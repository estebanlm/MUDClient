*RpgClient
act: aBlock icon: anIcon entitled: aString enabledWhen: conditionBlock
	self 
		addAction: 
			(RpcAction new 
				action: aBlock; 
				icon: anIcon;
				title: aString; 
				enabledCondition: conditionBlock;
				yourself)