connection
close 
	super close.
	self announce: RpcConnectionClosed new.
	self stopProcess.
	