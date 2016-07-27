private
applyTriggerFilter: aFilter to: aStream line: aString in: aTerminal
	| output |
	output := aFilter output.
	"Apply other filters transformations, so we can use, for example, aliases and variables"
	aTerminal activePlugins 
		reject: [ :each | each = aFilter ]
		thenDo: [ :each | output := each filterOn: aTerminal input: output ]. 
	aTerminal send: output.
	^ self applyNullFilterTo: aStream line: aString in: aTerminal