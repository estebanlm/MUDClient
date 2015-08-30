*MUDClient-Plugin-Buttonpad
renderPadActionListPresentation: anActionListPresentation
	^ MUDMorphicPadActionListRenderer 
		render: anActionListPresentation 
		from: self