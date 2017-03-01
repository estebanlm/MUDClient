private
applyRedirectFilter: aFilter pattern: aPattern to: aStream line: aLine in: aTerminal 
	| windows |
	
	"Filter is echoing. I need to send to screen anyway"
	aFilter isEcho 
		ifTrue: [ self applyNullFilterTo: aStream line: aLine in: aTerminal ].
	
	"Filter is sending messages to desktop"
	aFilter isEchoDesktop 
		ifTrue: [ self informFilter: aFilter line: aLine ].

	windows := aTerminal dependentWindowsOf: self.
	aFilter 
		send: aLine lineWithoutLineEnding
		toWindows: (windows select: [ :each | each filter = aFilter]).
	^ aPattern eatLines ifNil: [0]