accessing
parser
	^ parser ifNil: [ parser := RpcANSIParser new ]