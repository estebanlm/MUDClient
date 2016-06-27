updating
update: aSymbol 
	"Refer to the comment in View|update:."
	aSymbol == self getValueSelector ifTrue: [ ^ self updateValue ].
	aSymbol == self getMaxSelector ifTrue: [ ^ self updateMax ]