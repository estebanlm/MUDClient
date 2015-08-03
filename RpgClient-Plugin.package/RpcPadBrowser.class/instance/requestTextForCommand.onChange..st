actions
requestTextForCommand: aCommand onChange: aBlock 
	| text |
	
	text := UIManager default request: 'Command to send'.
	text ifNil: [ ^ self ].
	aCommand text: text.
	aBlock cull: aCommand