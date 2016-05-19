private
ansiParser
	^ ansiParser ifNil: [ ansiParser := MUDANSIParser new ]