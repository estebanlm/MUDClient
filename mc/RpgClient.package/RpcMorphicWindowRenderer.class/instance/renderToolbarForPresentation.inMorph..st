rendering
renderToolbarForPresentation: aPresentation inMorph: aMorph
	| dock buttons |
	
	dock := aMorph theme newToolDockingBarIn: aMorph.
	aPresentation toolbarPosition configureToolbar: dock.
	buttons := self toolbarButtonsForPresentation: aPresentation.
	dock addAllMorphs: buttons.
	
	^ dock