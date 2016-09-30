private
applyRedirectFilter: aFilter pattern: aPattern to: aStream line: aString in: aTerminal 
	| windows |
	
	"Filte ris echoing. I need to send to screen anyway"
	aFilter isEcho ifTrue: [ aStream << aString; lf ].
	
	windows := aTerminal dependentWindowsOf: self.
	aFilter send: aString toWindows: (windows select: [ :each | each filter = aFilter]).
	^ aPattern eatLines ifNil: [0]