Extension { #name : #GLMCompositePresentation }

{ #category : #'*MUDClient' }
GLMCompositePresentation >> enhancedTabbedArrangement [
	^ self arrangement: MUDEnhancedTabbedArrangement new
]

{ #category : #'*MUDClient' }
GLMCompositePresentation >> iconActionList [
	^ self custom: MUDIconActionListPresentation new
]
