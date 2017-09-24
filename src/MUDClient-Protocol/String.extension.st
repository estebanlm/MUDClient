Extension { #name : #String }

{ #category : #'*MUDClient-Protocol' }
String >> acceptCommand: aVisitor [
	aVisitor visitString: self
]
