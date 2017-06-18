private accessing
mapPaneMorph
	| mapPane morph |

	morph := self mapMorph.
	(mapPane := GeneralScrollPane new)
		hResizing: #spaceFill;
		vResizing: #spaceFill.
	mapPane scroller addMorph: morph.
	
	^ mapPane