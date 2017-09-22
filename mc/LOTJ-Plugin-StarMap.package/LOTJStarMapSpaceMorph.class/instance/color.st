accessing
color 
	^ self point color
		ifNil: [ Color darkGray muchDarker ]