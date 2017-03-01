private
applyAlertFilter: aFilter to: aStream line: aLine in: aTerminal 
	"Filter is sending messages to desktop"
	
	aFilter isEchoDesktop 
		ifTrue: [ self informFilter: aFilter line: aLine ].
	aTerminal alert 
		alertTitle: aFilter name 
		contents: aLine lineWithoutLineEnding
		position: aFilter notifyPosition
		color: aFilter alertColor.
	
	^ self applyNullFilterTo: aStream line: aLine in: aTerminal 