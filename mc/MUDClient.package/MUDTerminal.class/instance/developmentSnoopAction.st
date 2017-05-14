building
developmentSnoopAction
	^ MUDAction new 
		action: [ self doDevelopmentSnoop ];
		title: 'Snoop this session';
		category: 'Development';
		enabledCondition: [ session notNil and: [ session isRunning ] ];
		yourself