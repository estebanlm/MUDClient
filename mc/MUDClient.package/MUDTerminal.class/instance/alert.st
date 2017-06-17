accessing
alert 
	^ alert ifNil: [ alert := MUDAlertManager for: self areaMorph ]