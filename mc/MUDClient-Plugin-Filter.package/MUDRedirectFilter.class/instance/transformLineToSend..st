private
transformLineToSend: aLine
	self isTimestamp ifTrue: [ ^ aLine lineWithDecoration ].
	^ aLine lineWithoutLineEnding