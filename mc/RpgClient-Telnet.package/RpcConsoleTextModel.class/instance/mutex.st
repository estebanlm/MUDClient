private
mutex 
	^ mutex ifNotNil: [ mutex := Mutex new ]