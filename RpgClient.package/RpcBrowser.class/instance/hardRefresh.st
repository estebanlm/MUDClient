showing
hardRefresh
	"Reopens browser window recalculating browser "
	| position |
	window ifNil: [ ^ self open ].
	position := window position.
	window delete.
	window := nil.
	glamourBrowser := nil.
	self open.
	window position: position