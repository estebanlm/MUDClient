accessing
centerMapOnPane: pane
	| region origin corner |
	
	region := self starMap calculateRegion.
	origin := self sectorToPosition: region origin. 
	corner := self sectorToPosition: region corner.
	pane scrollToShow: (origin corner: corner)
	