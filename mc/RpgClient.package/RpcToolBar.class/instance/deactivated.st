accessing
deactivated
	"A game has been deactivated, I need to refresh browser (if open)"
	browser ifNil: [ ^ self ].
	browser update