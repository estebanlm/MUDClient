Extension { #name : #Object }

{ #category : #'*MUDClient-Protocol' }
Object >> acceptCommand: aVisitor [ 
	aVisitor visitString: self asString
]
