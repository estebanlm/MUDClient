updating
updateMax
	self model ifNotNil: [
		self getMaxSelector ifNotNil: [
			self max: (self model perform: self getMaxSelector)]]	