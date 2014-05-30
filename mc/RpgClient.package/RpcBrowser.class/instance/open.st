showing
open
	window 
		ifNotNil: [ self ensureShowWindow ] 
		ifNil: [ self ensureCreateWindow ].
	self postOpen