private
basicAppendText: aStringOrText
	self mutex critical: [  
		self text append: aStringOrText.
		self text lineCount > self maxLines
			ifTrue: [ self removeFirstLines ] ]