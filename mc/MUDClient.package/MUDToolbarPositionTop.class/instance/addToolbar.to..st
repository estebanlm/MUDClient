configuring morphs
addToolbar: toolbarMorph to: aMorph
	| frame |
	frame := (0@0 corner: 1@0) asLayoutFrame bottomOffset: 20.
	aMorph addMorph: toolbarMorph fullFrame: frame.
	^ Margin left: 0 top: 20 right: 0 bottom: 0