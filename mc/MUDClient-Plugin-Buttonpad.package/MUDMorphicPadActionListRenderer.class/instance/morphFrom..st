rendering
morphFrom: anActionListPresentation 
	| buttonsContainer buttonModel button |
	
	buttonsContainer := self rectangleMorphFrom: anActionListPresentation.
	anActionListPresentation allActions do: [ :each | 
		buttonModel := MUDPadButtonModel new.
		buttonModel glamourPresentation: anActionListPresentation.
		buttonModel glamourAction: each.

		button := self buttonMorph: buttonModel.
		button hResizing: #spaceFill.
		buttonsContainer addMorphBack: button ].
	
	^ buttonsContainer