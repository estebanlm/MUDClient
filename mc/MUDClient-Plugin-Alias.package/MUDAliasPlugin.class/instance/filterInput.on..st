filtering
filterInput: aString on: aConsole
	| alias |
	alias := (self aliases 
		detect: [ :each | each matches: aString ] 
		ifNone: [ ^ false  "not filtered" ]).
	alias executeOn: aConsole.
	^ true "filtered"