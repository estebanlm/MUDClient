Extension { #name : #GLMCompositePresentation }

{ #category : #'*MUDClient-Plugin-Buttonpad' }
GLMCompositePresentation >> padActionList [
	^ self custom: MUDPadActionListPresentation new
]
