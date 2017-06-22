actions
connect 
	^ TelnetSession new
		handler: (TelnetStreamThreadedHandler new 
			addDecoration: TelnetEnsureANSIDecoration new;
			yourself);
	 	in: [ :session | self protocolHandlers do: [ :each | session addProtocolHandler: each ] ];
		connectTo: self host port: self port