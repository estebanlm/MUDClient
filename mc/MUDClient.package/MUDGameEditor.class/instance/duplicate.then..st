actions
duplicate: aGame then: aBlock
	| newName |
	
	newName := UIManager default 
		request: 'Game name' 
		initialAnswer: aGame name 
		title: 'Name of the duplicated game'.
	newName isEmptyOrNil ifTrue: [ ^ self ].
	
	(aGame cloneAs: newName) save.
	aBlock value