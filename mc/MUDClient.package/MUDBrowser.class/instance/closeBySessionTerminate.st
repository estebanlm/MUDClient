showing
closeBySessionTerminate
	"Called when sessions are terminated (not a regular close)"
	| isOpened |
	self window ifNil: [ ^ self ].
	isOpened := self window isDisplayed.
	self close.
	isOpened ifTrue: [ self browserSettings opened ]
	