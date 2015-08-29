private
ensureShowWindow
	self window model ifNil: [ self window model: self ].
	self window ensureShown