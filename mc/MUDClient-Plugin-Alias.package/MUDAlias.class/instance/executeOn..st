executing
executeOn: aConsole 
	self output linesDo: [ :each | aConsole send: each ] 
