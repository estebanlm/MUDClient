generating
go
	window := self buildWindow autoRelease.
	window connectHide: [ self continue ].
	window modal: true.
	window center.
	window show.

	self waitUntilClosed.

	^ self value