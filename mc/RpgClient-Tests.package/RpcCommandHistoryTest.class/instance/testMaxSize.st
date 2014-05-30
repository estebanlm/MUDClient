tests
testMaxSize 
	history maxSize: 10.
	1 to: 100 do: [ :index | history add: 'Test ', (index asString) ].
	self assert: history elements first equals: 'Test 91'.
	self assert: history elements last equals: 'Test 100'.
	self assert: history elements size = 10