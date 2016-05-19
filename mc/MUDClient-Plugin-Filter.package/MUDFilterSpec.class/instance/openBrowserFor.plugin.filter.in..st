private
openBrowserFor: aGame plugin: aPlugin filter: aFilter in: aTerminal
	self flag: #todo. "HACK because doubleClick action is being executed several times"
	(MUDFilterBrowser allSubInstances anySatisfy: [ :each | each filter == aFilter ])
		ifTrue: [ ^ self ].
		
	(MUDFilterBrowser game: aGame plugin: aPlugin filter: aFilter)
		openOn: aTerminal