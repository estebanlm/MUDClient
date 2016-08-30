generating
go
	window := self buildWindow autoRelease.
	window modal: true.
	window center.
	window show.
	self waitUntilClosed: window.
	^ self value