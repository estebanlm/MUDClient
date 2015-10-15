accessing
playSound
	self hasSound ifFalse: [ ^ self ].
	(self class soundNamed: self soundName) play