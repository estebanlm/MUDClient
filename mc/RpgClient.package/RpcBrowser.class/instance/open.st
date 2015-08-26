showing
open
	self window 
		ifNotNil: [ self ensureShowWindow ] 
		ifNil: [ self ensureOpenWindow ].
	self window model: self.
	self postOpen