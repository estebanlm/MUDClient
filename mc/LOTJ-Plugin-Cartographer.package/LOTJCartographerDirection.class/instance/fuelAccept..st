hooks
fuelAccept: aGeneralMapper
	^ aGeneralMapper 
		visitGlobalSend: self 
		name: self className 
		selector: #uniqueInstance