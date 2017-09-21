accessing
connectionAt: aDirectionOrSymbol ifAbsent: aBlock
	| direction |
	direction := aDirectionOrSymbol asDirection.
	^ self connections 
		detect: [ :each | each direction = direction ] 
		ifNone: aBlock