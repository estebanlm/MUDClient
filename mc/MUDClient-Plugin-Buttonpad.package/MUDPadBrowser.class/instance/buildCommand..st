building
buildCommand: aCommand
	^ MUDPadAction new
		title: [ aCommand title ];
		action: [ :presenter | self execute: aCommand then: [ presenter update ] ];
		addAction: (GLMGenericAction new 
			title: 'Edit';
			action: [ :presenter | self requestTextForCommand: aCommand then: [ presenter update ] ];
			yourself);
		addAction: (GLMGenericAction new 
			title: 'Clear';
			action: [ :presenter | self clear: aCommand then: [ presenter update ] ];
			yourself);
		yourself 