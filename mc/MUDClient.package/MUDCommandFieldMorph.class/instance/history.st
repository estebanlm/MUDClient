accessing history
history 
	^ history ifNil: [ history := MUDCommandHistory new ]