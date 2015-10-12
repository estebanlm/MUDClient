visitor
visitCollection: aCollection 
	aCollection do: [ :each | self put: each ]