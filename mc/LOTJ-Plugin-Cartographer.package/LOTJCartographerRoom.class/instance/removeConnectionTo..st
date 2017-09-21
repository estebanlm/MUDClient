accessing
removeConnectionTo: aDirectionOrSymbol
	| connection |
	connection := self connectionAt: aDirectionOrSymbol ifAbsent: [ ^ self ]. 
	connections remove: connection