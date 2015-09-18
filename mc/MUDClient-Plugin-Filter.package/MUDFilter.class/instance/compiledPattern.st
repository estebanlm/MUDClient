accessing
compiledPattern
	^ compiledPattern ifNil: [ compiledPattern := self compilePattern ]