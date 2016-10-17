accessing
lineWithoutLineEnding
	^ lineWithoutLineEnding ifNil: [ lineWithoutLineEnding := self line trimRight ]