external projects
objCBridge: spec
	spec
		package: 'Alien-MacOSX-Core-EstebanLorenzano.14' 
			with: [ spec repository: 'http://www.squeaksource.com/Alien' ];
		package: 'Alien-MacOSX-Pharo-EstebanLorenzano.1' 
			with: [ spec repository: 'http://www.squeaksource.com/Alien' ].
			
	spec group: 'ObjCBridge' 
		with: #('Alien-MacOSX-Core-EstebanLorenzano.14' 'Alien-MacOSX-Pharo-EstebanLorenzano.1')