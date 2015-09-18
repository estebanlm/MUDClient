private
dirtiesAt: aFilter 
	^ dirties 
		at: aFilter 
		ifAbsentPut: [ false ]