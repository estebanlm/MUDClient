Extension { #name : #GLMMorphicRenderer }

{ #category : #'*MUDClient-Plugin-Buttonpad' }
GLMMorphicRenderer >> renderPadActionListPresentation: anActionListPresentation [
	^ MUDMorphicPadActionListRenderer 
		render: anActionListPresentation 
		from: self
]
