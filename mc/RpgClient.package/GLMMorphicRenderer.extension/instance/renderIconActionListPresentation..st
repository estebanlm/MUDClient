*RpgClient
renderIconActionListPresentation: anActionListPresentation
	^ RpcMorphicIconActionListRenderer 
		render: anActionListPresentation 
		from: self