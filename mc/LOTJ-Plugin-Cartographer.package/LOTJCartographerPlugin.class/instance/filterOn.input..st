filtering
filterOn: aTerminal input: aString
	self class runner 
		schedule: [ self processOn: aTerminal input: aString ].
	^ super filterOn: aTerminal input: aString