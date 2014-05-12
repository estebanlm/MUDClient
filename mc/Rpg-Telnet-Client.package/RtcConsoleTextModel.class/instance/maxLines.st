accessing
maxLines
	^ maxLines ifNil: [ self class defaultMaxLines ]