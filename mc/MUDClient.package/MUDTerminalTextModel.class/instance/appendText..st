accessing
appendText: aStringOrText
	self basicAppendText: aStringOrText.
	[ self announcer announce: RubTextUpdatedInModel ]
	on: Error 
	do: [ :e | self log debug: e messageText ]	