private register
register
	^ register ifNil: [ register := MUDSessionLog game: self game ]	