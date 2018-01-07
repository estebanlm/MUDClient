"
I'm a glamour presentation to define icon action lists (toolbars)
"
Class {
	#name : #MUDIconActionListPresentation,
	#superclass : #GLMActionListPresentation,
	#category : #'MUDClient-View-Glamour'
}

{ #category : #rendering }
MUDIconActionListPresentation >> renderGlamorouslyOn: aRenderer [
	self registerAnnouncements.
	^ aRenderer renderIconActionListPresentation: self
]
