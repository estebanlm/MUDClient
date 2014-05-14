accessing history
history 
	^ history ifNil: [ history := RpcCommandHistory new ]