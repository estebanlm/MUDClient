private factory
createInspectAction
	^ MUDAction new 
		action: [ self room inspect ];
		title: 'inspect';
		category: 'DEBUG';
		yourself