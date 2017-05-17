private factory
createStarMapPanel
	| pane |
	
	mapMorph := LOTJStarMapMorph new 
		starMap: self starMap;
		yourself.
	
	pane := ScrollPane new.
	pane scroller addMorph: mapMorph.
	pane 
		hResizing: #spaceFill;
		vResizing: #spaceFill.

	^ pane