"
I'm a glamour renderer that renders icon action lists (toolbars)
"
Class {
	#name : #MUDMorphicIconActionListRenderer,
	#superclass : #GLMMorphicActionListRenderer,
	#category : 'MUDClient-View-Glamour'
}

{ #category : #private }
MUDMorphicIconActionListRenderer >> buttonMorph: aModel [
	^ (Smalltalk ui theme
		newButtonIn: nil 
		for: aModel
		getState: nil
		action: #execute
		arguments: {}
		getEnabled: nil
		label: (AlphaImageMorph new image: aModel glamourAction icon)
		help: aModel glamourAction title trimBoth)
		valueOfProperty: #noBorder ifAbsentPut: [ true ];
		valueOfProperty: #noFill ifAbsentPut: [ true ];
		setProperty: #wantsKeyboardFocusNavigation toValue: false; 
		borderWidth: 0;
		yourself
]

{ #category : #private }
MUDMorphicIconActionListRenderer >> buttonWidthFor: aModel [
	^ aModel glamourAction icon width + 8
]

{ #category : #private }
MUDMorphicIconActionListRenderer >> morphFrom: anActionListPresentation [ 
	| buttonsContainer buttonModel button maxWidth |
	
	maxWidth := 0.
	buttonsContainer := self rectangleMorphFrom: anActionListPresentation.
	anActionListPresentation allActions do: [ :each | 
		buttonModel := GLMButtonModel new.
		buttonModel glamourPresentation: anActionListPresentation.
		buttonModel glamourAction: each.

		button := self buttonMorph: buttonModel.
		buttonsContainer addMorphBack: button.
		button width: (self buttonWidthFor: buttonModel).
		maxWidth := maxWidth max: (button width) ].
	
	buttonsContainer width: maxWidth.
	
	^ buttonsContainer
]
