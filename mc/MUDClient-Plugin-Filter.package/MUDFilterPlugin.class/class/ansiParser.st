accessing
ansiParser
	^ ANSIParser ifNil: [ ANSIParser := MUDANSIParser new ]