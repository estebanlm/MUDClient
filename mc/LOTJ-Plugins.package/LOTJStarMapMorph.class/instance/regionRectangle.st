accessing
regionRectangle
	^ regionRectangle ifNil: [ regionRectangle := self starMap calculateRegion ]