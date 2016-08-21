accessing
name 
	^ self filterClass ifNotNil: [ :c | c label ]