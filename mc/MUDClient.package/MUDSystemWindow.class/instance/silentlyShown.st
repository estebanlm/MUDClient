open/close
silentlyShown
	| currentPosition |
	self isDisplayed ifTrue: [ ^ self ].
	currentPosition := self position.
	self openAsIs.
	self position: currentPosition. "Restore position to ensure is displayed correctly"