actions
connect 
	^ (TelnetSession new
		handler: (TelnetStreamHandler new 
			alwaysFlush;
			addDecoration: TelnetLfDecoration new;
			addDecoration: TelnetANSIDecoration new;
			yourself);
	 	in: [ :session | self protocolHandlers do: [ :each | session addProtocolHandler: each ] ];
		connectTo: self host port: self port)
		yourself