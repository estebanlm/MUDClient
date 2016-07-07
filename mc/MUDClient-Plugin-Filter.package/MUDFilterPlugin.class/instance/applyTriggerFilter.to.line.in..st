private
applyTriggerFilter: aFilter to: aStream line: aString in: aTerminal
	aTerminal send: aFilter output.
	^ self applyNullFilterTo: aStream line: aString in: aTerminal