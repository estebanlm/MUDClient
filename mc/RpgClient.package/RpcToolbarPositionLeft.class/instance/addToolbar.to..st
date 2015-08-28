configuring morphs
addToolbar: toolbarMorph to: aMorph
	| frame |
	frame := (0 @ 0 corner: 0 @ 1) asLayoutFrame rightOffset: 28.
	aMorph addMorph: toolbarMorph fullFrame: frame.
	^ Margin left: 28 top: 0 right: 0 bottom: 0