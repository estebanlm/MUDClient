private
morphFrom: anActionListPresentation 
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