accessing
defaultTextColor
	^ defaultTextColor ifNil: [ Smalltalk ui theme textColor ]