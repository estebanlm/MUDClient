*RpgClient-Plugin
renderPadActionListPresentation: anActionListPresentation
	^ RpcMorphicPadActionListRenderer 
		render: anActionListPresentation 
		from: self