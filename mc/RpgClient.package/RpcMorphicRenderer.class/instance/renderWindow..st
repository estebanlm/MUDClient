as yet unclassified
renderWindow: aRenderable 
	^ self windowRendererClass
		render: aRenderable 
		from: self