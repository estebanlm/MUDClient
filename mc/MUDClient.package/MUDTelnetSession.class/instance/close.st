connection
close 
	super close.
	self announce: MUDConnectionClosed new.
	self stopProcess.
	