rendering actions
renderWindow: aRenderable 
	^ self windowRendererClass
		render: aRenderable 
		from: self