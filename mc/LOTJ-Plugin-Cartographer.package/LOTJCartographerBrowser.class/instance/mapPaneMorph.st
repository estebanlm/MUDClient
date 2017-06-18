private accessing
mapPaneMorph
	| mapPane |

	(mapPane := GeneralScrollPane new)
		hResizing: #spaceFill;
		vResizing: #spaceFill.
	mapPane scroller 
		removeAllMorphs;
		addMorph: self mapMorph.
	
	^ mapPane