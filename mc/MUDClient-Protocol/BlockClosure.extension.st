Extension { #name : #BlockClosure }

{ #category : #'*MUDClient-Protocol' }
BlockClosure >> acceptCommand: aVisitor [ 
	aVisitor visitBlockClosure: self
]
