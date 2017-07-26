accessing
removeConnectionTo: aDirection 
	self connections 
		detect: [ :each | each direction = aDirection ]
		ifFound: [ :each | self connections remove: each ]