accessing
childrenOf: aNode 
	^ aNode children sorted: [ :a :b | a name < b name ]