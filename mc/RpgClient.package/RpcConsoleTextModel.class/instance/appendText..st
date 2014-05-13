accessing
appendText: aStringOrText
	self mutex critical: [ 
		self basicAppendText: aStringOrText ]