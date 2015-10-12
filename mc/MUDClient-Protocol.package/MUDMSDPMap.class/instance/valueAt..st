accessing
valueAt: aString 
	^ (self map 
		detect: [ :each | each variableName = aString ])
		value