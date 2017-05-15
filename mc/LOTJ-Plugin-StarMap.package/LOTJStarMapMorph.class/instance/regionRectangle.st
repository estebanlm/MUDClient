accessing
regionRectangle
	^ -125@125 corner: 125@ -125  
	"regionRectangle ifNil: [ regionRectangle := self starMap calculateRegion ]"