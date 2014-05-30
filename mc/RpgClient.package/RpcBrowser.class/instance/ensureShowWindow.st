showing
ensureShowWindow
	| position |
	window isDisplayed ifTrue: [ ^ self ].
	position := window position.
	window openAsIs.
	window position: position