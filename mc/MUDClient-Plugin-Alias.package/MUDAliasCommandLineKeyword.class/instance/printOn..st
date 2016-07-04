printing
printOn: stream 
	stream 
		<< self value 
		<< '('; print: (self argument ifNil: [ '' ]); << ')'