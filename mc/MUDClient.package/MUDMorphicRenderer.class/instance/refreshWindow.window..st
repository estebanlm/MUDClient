rendering actions
refreshWindow: aRenderable window: aWindow 
	^ aRenderable windowRendererClass
		refresh: aRenderable 
		window: aWindow
		from: self