accessing send
sendCommand: bytes 
	self isRunning ifFalse: [ ^ self ].
	outputScheduler schedule: [ 
		self isRunning ifTrue: [ 
			"ensure ESC is included"
			self session nextPutAll: (bytes first = ESC 
				ifTrue: [ bytes ]	
				ifFalse: [ bytes copyWithFirst: ESC ]) ] ]