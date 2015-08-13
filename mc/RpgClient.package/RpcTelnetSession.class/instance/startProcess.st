waiting
startProcess
	self isRunning ifTrue: [ ^ self ]. "Is already running"
	dataProcess := [ [ [ self isRunning ] whileTrue: [ self waitAndReceive ] ]
		on: ConnectionClosed 
		do: [ :e | 
			self announce: RpcConnectionClosed new.
			self finishWithError: e ] ] 
	 forkNamed: ('Telnet waiting {1}:{2}' format: { self host. self port })