*RpgClient
act: aBlock icon: anIcon entitled: aString when: conditionBlock
	self 
		addAction: 
			((GLMGenericAction new) 
				action: aBlock; 
				icon: anIcon;
				title: aString; 
				condition: conditionBlock;
				yourself)