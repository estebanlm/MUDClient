accessing
filters
	^ self plugin activeFilters select: [ :each | each isAlert not ]