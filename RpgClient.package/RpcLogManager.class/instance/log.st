accessing
log 
	^ log ifNil: [ log := Logger new ]