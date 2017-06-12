drawing
drawOn: canvas 
	super drawOn: canvas.
	"self space hasUnexploredConnections 
		ifTrue: [ self drawUnexploredConnectionsOn: canvas ]"