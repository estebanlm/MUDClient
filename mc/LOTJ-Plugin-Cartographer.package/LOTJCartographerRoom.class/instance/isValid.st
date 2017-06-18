testing
isValid
	^ self number notNil 
		and: [ self number ~= 0 ]