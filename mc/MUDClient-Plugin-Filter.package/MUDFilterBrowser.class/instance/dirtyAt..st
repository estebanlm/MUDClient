private
dirtyAt: aFilter 
	^ dirties 
		at: aFilter 
		ifAbsentPut: [ false ]