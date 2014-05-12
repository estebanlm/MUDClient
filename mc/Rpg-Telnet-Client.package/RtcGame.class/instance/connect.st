actions
connect 
	^ self class sessionClass 
		connectTo: self host 
		port: self port