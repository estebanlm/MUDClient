showing
open
	window 
		ifNotNil: [ self ensureShowWindow ] 
		ifNil: [ self ensureOpenWindow ].
	window browserModel: self.
	self postOpen