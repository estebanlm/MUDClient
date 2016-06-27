updating
updateValue
	self model ifNotNil: [
		self getValueSelector ifNotNil: [
			self value: (self model perform: self getValueSelector)]]	