accessing
removeConnectionAt: aDirection 
	self connections copy 
		detect: [ :each | each direction = aDirection ]
		ifFound: [ :each | self connections remove: each ]