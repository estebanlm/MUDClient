rendering
renderToolbarForPresentation: aPresentation inMorph: aMorph
	| dock buttons |
	
	dock := aMorph theme newToolDockingBarIn: aMorph.
	buttons := self toolbarButtonsForPresentation: aPresentation.
	dock addAllMorphs: buttons.
	
	^ dock