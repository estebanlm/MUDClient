private
applyNullFilterTo: aStream line: aLine in: aTerminal 
	aLine isEchoed ifTrue: [ ^ 0 ].
	aLine echoed.
	aStream << aLine line.
	^ 0