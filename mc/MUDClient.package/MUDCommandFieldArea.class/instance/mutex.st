accessing
mutex 
	^ mutex ifNil: [ mutex := Mutex new ]