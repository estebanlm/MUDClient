accessing
parser
	^ parser ifNil: [ parser := MUDANSIParser new ]