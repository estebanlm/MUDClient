accessing
parser 
	^ parser ifNil: [ parser := MUDMSDPParser new ]