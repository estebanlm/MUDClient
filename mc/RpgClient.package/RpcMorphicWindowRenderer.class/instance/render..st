rendering
render: aRenderable

	window := RpcSystemWindow new model: aRenderable.

	self installActionsOnModel: window fromPresentation: aRenderable .
	self installKeystrokeActionsOnMorph: window fromPresentation: aRenderable.

	^ self basicRender: aRenderable