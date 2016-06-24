private
parser 
	^ parser ifNil: [ parser := MUDMSDPParser new ]