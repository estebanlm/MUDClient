accessing
normalColorMap
	^ normalColorMap ifNil: [ normalColorMap := self createNormalColorMap ]