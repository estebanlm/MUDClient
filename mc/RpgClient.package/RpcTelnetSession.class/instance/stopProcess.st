waiting
stopProcess
	self isRunning ifFalse: [ ^ self ].
	dataProcess terminate.
	dataProcess := nil	