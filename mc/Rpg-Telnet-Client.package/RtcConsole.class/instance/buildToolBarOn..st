building
buildToolBarOn: aPresentation
	aPresentation 
		act: [ self connect ] 
			icon: (RtcIcons uniqueInstance iconNamed: #connect)
			entitled: 'Connect';
		act: [ self configure ] 
			icon: (RtcIcons uniqueInstance iconNamed: #configure) 
			entitled: 'Configure'.