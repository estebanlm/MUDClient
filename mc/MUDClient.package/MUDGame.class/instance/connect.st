actions
connect 
	^ (self class sessionClass 
		connectTo: self host port: self port)
		in: [ :session | self protocols do: [ :each | session registerProtocol: each ] ];
		yourself