private
applyNullFilterTo: aStream line: aLine in: aTerminal 
	aLine isEchoed ifTrue: [ ^ self ].
	aStream << aLine line; lf.
	aLine echoed.
	^ 0