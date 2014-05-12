accessing
appendText: aStringOrText
	self mutex critical: [ 
		self basicAppentText: aStringOrText ]