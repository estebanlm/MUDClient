accessing
parser 
	^ parser ifNil: [ parser := MUDMSDPCreatorParser new ]