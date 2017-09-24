Extension { #name : #Dictionary }

{ #category : #'*MUDClient-Protocol' }
Dictionary >> acceptCommand: aVisitor [ 
	aVisitor visitDictionary: self
]
