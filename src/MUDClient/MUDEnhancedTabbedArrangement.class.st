Class {
	#name : #MUDEnhancedTabbedArrangement,
	#superclass : #GLMTabbedArrangement,
	#category : 'MUDClient-View-Glamour'
}

{ #category : #rendering }
MUDEnhancedTabbedArrangement >> renderGlamorouslyOn: aRenderer [
	^ aRenderer renderEnhancedTabbedCompositePresentation: self composite
]
