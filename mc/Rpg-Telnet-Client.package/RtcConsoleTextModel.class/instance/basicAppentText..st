private
basicAppentText: aStringOrText
	self text append: aStringOrText.
	self text lineCount > self maxLines
		ifTrue: [ self removeFirstLines ].
	^ [ self announcer announce: RubTextUpdatedInModel ]
		on: Error
		do: [ :e | self crTrace: e messageText ]