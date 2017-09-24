Extension { #name : #BlockClosure }

{ #category : #'*MUDClient-View' }
BlockClosure >> executeOnUIThread [
	World defer: self
]
