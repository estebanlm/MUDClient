tests
testBuild
	| points |
	
	points := self pointsForTest.
	self assert: points size equals: 16
	