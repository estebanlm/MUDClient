accessing
refresh
	"A game has been activated, I need to refresh browser (if open)"
	browser ifNil: [ ^ self ].
	browser update