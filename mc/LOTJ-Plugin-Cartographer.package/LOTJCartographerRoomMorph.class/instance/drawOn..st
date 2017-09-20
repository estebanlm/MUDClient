drawing
drawOn: canvas
	| directions |
	super drawOn: canvas.
	self isCurrent ifTrue: [ self drawCurrentOn: canvas ].
	directions := Set new.
	"Draw connections"
	self room withLevelConnectionsDo: [ :each | 
		directions add: each direction.
		self dracConnection: each on: canvas ].
	"Draw unexplored exits"
	(self room levelExits \ directions)
		reject: #isUnknown
		thenDo: [ :each |  
			self drawUnexploredConnectionDirection: each on: canvas  ]