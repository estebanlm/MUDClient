showing
open
	window 
		ifNotNil: [ self ensureShowWindow ] 
		ifNil: [ self ensureOpenWindow ].
	window model: self.
	self postOpen