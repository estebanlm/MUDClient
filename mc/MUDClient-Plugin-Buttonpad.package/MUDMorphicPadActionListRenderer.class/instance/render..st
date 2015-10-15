rendering
render: aPresentation
	container := GLMMorphic containerMorph. 
	container 
		changeTableLayout;
		listDirection: (aPresentation isHorizontal 
			ifTrue: [ #leftToRight ]
			ifFalse: [ #topToBottom ]);
		cellSpacing: #none;
		cellInset: 0;
		vResizing: #spaceFill;
		hResizing: #spaceFill.
	container addMorphBack: (self morphFrom: aPresentation).
	aPresentation when: GLMPresentationUpdated send: #actOnPresentationUpdated: to: self.
	^container 