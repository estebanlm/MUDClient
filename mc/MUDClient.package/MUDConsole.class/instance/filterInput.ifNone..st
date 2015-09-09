private
filterInput: data ifNone: aBlock
	(self game plugins 
		anySatisfy: [ :each | each filterInput: data on: self ])
		ifFalse: aBlock