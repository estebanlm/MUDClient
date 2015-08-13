showing
open
	self window 
		ifNotNil: [ self ensureShowWindow ] 
		ifNil: [ self ensureOpenWindow ].
	self window model: self.
	self window extent: self preferredExtent.
	self postOpen