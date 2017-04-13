rendering
morphFrom: anActionListPresentation 
	| buttonsContainer buttonModel button |
	
	buttonsContainer := self rectangleMorphFrom: anActionListPresentation.
	anActionListPresentation allActions do: [ :each | 
		buttonModel := MUDPadButtonModel new.
		buttonModel glamourPresentation: anActionListPresentation.
		buttonModel glamourAction: each.

		button := self buttonMorph: buttonModel.
		buttonsContainer addMorphBack: button ].
	
	^ buttonsContainer