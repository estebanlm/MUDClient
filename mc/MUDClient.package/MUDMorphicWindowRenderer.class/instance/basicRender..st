rendering
basicRender: aRenderable
	| toolbarMorph contentMorph toolbarOffsets topOffset bottomOffset |

	toolbarOffsets := 0@0 corner: 0@0.
	topOffset := 4.
	bottomOffset := self handlePotentialStatusbarFor: aRenderable.

	self setLabelOf: window for: aRenderable.
	aRenderable hasToolbar ifTrue: [ 
		toolbarMorph := self renderToolbarForPresentation: aRenderable inMorph: window.
		window toolbarMorph: toolbarMorph.
		toolbarOffsets := aRenderable toolbarPosition 
			addToolbar: toolbarMorph 
			to: window ].

	contentMorph := self renderObject: aRenderable. 
	window contentMorph: contentMorph.	
	window
		addMorph: contentMorph
		fullFrame: ((0@0 corner: 1@1) asLayoutFrame 
			leftOffset: toolbarOffsets left;
			topOffset: topOffset + toolbarOffsets top;
			rightOffset: toolbarOffsets right;
			bottomOffset: bottomOffset + toolbarOffsets bottom;
			yourself).
	
	self setPotentialBackgroundColorFor: aRenderable.
	aRenderable when: GLMPresentationUpdated send: #actOnPresentationUpdated: to: self.
	aRenderable watcherPane notNil
		ifTrue: [ GLMMorphicWatcherRenderer render: aRenderable watcherPane from: self renderer ].
	
	^ window