generating
go
	window := self buildWindow autoRelease.
	window connectHide: [ self continue ].
	window modal: true.
	window center.
	window showAll.

	self waitUntilClosed.

	^ self value