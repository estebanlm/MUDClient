waiting
stopProcess
	self isRunning ifFalse: [ ^ self ].
	[ dataProcess terminate ]
	ensure: [ dataProcess := nil ]