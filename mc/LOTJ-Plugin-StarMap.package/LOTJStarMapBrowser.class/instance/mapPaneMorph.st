private accessing
mapPaneMorph
	| mapPane mapMorph |

	mapMorph := self starMapMorph.
	(mapPane := GeneralScrollPane new)
		hResizing: #spaceFill;
		vResizing: #spaceFill.
	mapPane scroller addMorph: mapMorph.
	mapMorph centerMapOnPane: mapPane.
	
	^ mapPane