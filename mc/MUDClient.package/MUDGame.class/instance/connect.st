actions
connect 
	^ (TelnetSession new
		handler: (TelnetStreamThreadedHandler new 
			alwaysFlush;
			addDecoration: TelnetEnsureANSIDecoration new;
			yourself);
	 	in: [ :session | self protocolHandlers do: [ :each | session addProtocolHandler: each ] ];
		connectTo: self host port: self port)
		yourself