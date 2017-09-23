accessing
addLine: aLine
	lines ifNil: [ lines := Set new ].
	lines add: aLine