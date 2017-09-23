building
inspectGameAction
	^ MUDAction new 
		action: [ self game inspect ];
		title: 'Inspect active game';
		category: 'Development';
		enabledCondition: [ self hasGame ];
		yourself