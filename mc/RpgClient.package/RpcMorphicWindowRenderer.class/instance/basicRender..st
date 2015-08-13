rendering
basicRender: aRenderable
	| toolbarMorph contentMorph offset bottomOffset |

	offset := 4.
	bottomOffset := self handlePotentialStatusbarFor: aRenderable.

	self setLabelOf: window for: aRenderable.

	aRenderable hasToolbar ifTrue: [ 
		toolbarMorph := self renderToolbarForPresentation: aRenderable inMorph: window.
		window toolbarMorph: toolbarMorph.
		window 
			addMorph: toolbarMorph
			fullFrame: ((0 @ 0 corner: 1 @ 0) asLayoutFrame
				topOffset: 0;
				bottomOffset: 20).
			offset := offset + 20 ].

	contentMorph := self renderObject: aRenderable. 
	window contentMorph: contentMorph.	
	window
		addMorph: contentMorph
		fullFrame: ((0@0 corner: 1@1) asLayoutFrame 
				topOffset: offset;
				bottomOffset: bottomOffset).
	
	self setPotentialBackgroundColorFor: aRenderable.
	aRenderable on: GLMPresentationUpdated send: #actOnPresentationUpdated: to: self.
	aRenderable watcherPane notNil
		ifTrue: [ GLMMorphicWatcherRenderer render: aRenderable watcherPane from: self renderer ].
	
	^ window