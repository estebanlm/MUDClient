accessing
actualRoom
	^ actualRoom ifNil: [ actualRoom := LOTJCartographerRoom new ]