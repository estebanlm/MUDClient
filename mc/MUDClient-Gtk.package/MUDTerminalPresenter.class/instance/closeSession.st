private session
closeSession
	(self session isNil or: [ self session isRunning not ]) ifTrue: [ ^ self ].
	self session close