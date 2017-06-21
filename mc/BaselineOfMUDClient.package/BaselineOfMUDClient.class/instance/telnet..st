external projects
telnet: spec
	spec 
		baseline: 'TelnetClient' with: [
			spec repository: 'github://estebanlm/telnet-client:master' ];
		import: 'TelnetClient'