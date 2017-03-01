accessing
cleanLine
	^ cleanLine ifNil: [ cleanLine := self parseCleanLine ]
