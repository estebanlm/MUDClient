accessing
send: aString
	self isRunning ifFalse: [ ^ self ].
	outputScheduler schedule: [ 
		self isRunning ifTrue: [ 
			self session nextPutAll: aString, String crlf ] ]