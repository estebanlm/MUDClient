private
applyRedirectFilter: aFilter pattern: aPattern to: aStream line: aString in: aTerminal 
	| windows |
	windows := aTerminal dependentWindowsOf: self.
	aFilter send: aString toWindows: (windows select: [ :each | each filter = aFilter]).
	^ aPattern eatLines ifNil: [0].