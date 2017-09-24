Extension { #name : #GLMMorphicRenderer }

{ #category : #'*MUDClient' }
GLMMorphicRenderer >> renderEnhancedTabbedCompositePresentation: aCompositePresentation [
	^ MUDMorphicEnhancedTabbedRenderer render: aCompositePresentation from: self
]

{ #category : #'*MUDClient' }
GLMMorphicRenderer >> renderIconActionListPresentation: anActionListPresentation [
	^ MUDMorphicIconActionListRenderer 
		render: anActionListPresentation 
		from: self
]
