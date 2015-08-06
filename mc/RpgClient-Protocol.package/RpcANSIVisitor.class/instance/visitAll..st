visitor
visitAll: aCollection 
	aCollection do: [ :each | self visit: each ]