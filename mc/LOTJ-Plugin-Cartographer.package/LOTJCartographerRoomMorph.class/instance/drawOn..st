drawing
drawOn: canvas 
	| directions |
	super drawOn: canvas.
	self isCurrent ifTrue: [ self drawCurrentOn: canvas ].
	directions := Set new.
	"Draw connections"
	self room withLevelConnectionsDo: [ :each | | fromPoint toPoint mod |
		directions add: each direction.
		mod := each direction coordinateModifier.
		fromPoint := self center + (mod * 5).
		toPoint := self center + (mod * (self owner roomSeparation / 2)) asIntegerPoint.
		canvas line: fromPoint to: toPoint width: 1 color: self connectionColor ].
	"Draw unexplored exits"
	(self room levelExits \ directions) do: [ :each | | fromPoint toPoint mod |
		mod := each coordinateModifier. 
		fromPoint := self center + (mod * 5).
		toPoint := self center + (mod * 10).
		canvas line: fromPoint to: toPoint width: 1 color: self connectionColor ]