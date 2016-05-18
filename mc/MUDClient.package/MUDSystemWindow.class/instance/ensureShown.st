open/close
ensureShown
	| currentPosition |
	self isDisplayed ifTrue: [ ^ self ].
	currentPosition := self position.
	self tkOpen.
	self position: currentPosition. "Restore position to ensure is displayed correctly"
	self announce: (WindowOpened new window: self)