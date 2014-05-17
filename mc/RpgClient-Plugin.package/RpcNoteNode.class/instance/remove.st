persistence
remove
	self isRoot 
		ifTrue: [ super remove ]
		ifFalse: [ 
			self parent remove: self.
			self root save ]