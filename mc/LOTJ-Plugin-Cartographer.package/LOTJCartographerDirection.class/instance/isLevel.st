testing
isLevel
	^ self ~= self class unknown 
		and: [ self ~= self class up 
		and: [ self ~= self class down ] ]