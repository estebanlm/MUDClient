*MUDClient-Plugin
renderPadActionListPresentation: anActionListPresentation
	^ MUDMorphicPadActionListRenderer 
		render: anActionListPresentation 
		from: self