accessing
maxSize
	^ maxSize ifNil: [ self class defaultMaxSize ]