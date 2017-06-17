accessing
sendCommand: bytes 
	self isRunning ifFalse: [ ^ self ].
	"ensure ESC is included"
	outputScheduler schedule: [ 
		self isRunning ifTrue: [ 
			self session rawWrite: (bytes first = ESC 
				ifTrue: [ bytes ]	
				ifFalse: [ bytes copyWithFirst: ESC ]) ] ]