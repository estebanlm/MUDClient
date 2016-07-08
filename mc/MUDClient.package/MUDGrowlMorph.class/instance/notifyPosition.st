accessing
notifyPosition
	^ notifyPosition ifNil: [ self class position ]