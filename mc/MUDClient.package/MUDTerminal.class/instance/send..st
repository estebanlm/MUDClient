accessing
send: aString
	self isRunning ifFalse: [ ^ self ].
	outputScheduler schedule: [ 
		self isRunning ifTrue: [ 
			self session writeln: aString ] ]