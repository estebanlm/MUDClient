accessing
startLine
	lines ifNil: [ lines := Set new ].
	lines add: LOTJStarMapLine new.
	self refresh