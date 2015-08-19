private register
register
	^ register ifNil: [ register := RpcSessionLog game: self game ]	