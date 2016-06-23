showing
restoreOn: aTerminal
	| browser |
	
	self isOpened ifFalse: [ ^ self ].
	
	browser := self newBrowser.
	browser openOn: aTerminal.
	self bounds ifNotNil: [ 
		browser window bounds: self bounds ] 