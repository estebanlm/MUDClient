accessing
console
	^ console ifNil: [ console := RpcConsole new ]