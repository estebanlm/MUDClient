Extension { #name : #Symbol }

{ #category : #'*MUDClient-View' }
Symbol >> asMUDIcon [
	^ MUDIcons uniqueInstance iconNamed: self
]
