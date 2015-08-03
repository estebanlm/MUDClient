accessing
refresh
	"A game has been activated, I need to refresh browser (if open)"
	activeBrowser ifNil: [ ^ self ].
	activeBrowser update