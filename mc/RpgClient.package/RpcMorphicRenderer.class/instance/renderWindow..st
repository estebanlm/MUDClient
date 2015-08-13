rendering actions
renderWindow: aRenderable 
	^ aRenderable windowRendererClass
		render: aRenderable 
		from: self