actions
execute: aCommand onChange: aBlock
	aCommand text 
		ifNotNil: [ aCommand executeFor: self client ]
		ifNil: [ self requestTextForCommand: aCommand onChange: aBlock ]