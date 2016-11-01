private
applyRedirectFilter: aFilter pattern: aPattern to: aStream line: aLine in: aTerminal 
	| windows |
	
	"Filte ris echoing. I need to send to screen anyway"
	aFilter isEcho ifTrue: [ 
		self applyNullFilterTo: aStream line: aLine in: aTerminal ].
	
	windows := aTerminal dependentWindowsOf: self.
	aFilter 
		send: (aFilter transformLineToSend: aLine)
		toWindows: (windows select: [ :each | each filter = aFilter]).
	^ aPattern eatLines ifNil: [0]