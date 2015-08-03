accessing
brightColorMap
	^ brightColorMap ifNil: [ brightColorMap := self createBrightColorMap ]