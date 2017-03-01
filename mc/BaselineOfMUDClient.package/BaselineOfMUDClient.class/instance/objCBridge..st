external projects
objCBridge: spec
	spec
		package: 'Alien-MacOSX-Core' with: [ 
			spec 
				file: 'Alien-MacOSX-Core-EstebanLorenzano.14';
				repository: 'http://www.squeaksource.com/Alien' ];
		package: 'Alien-MacOSX-Pharo' with: [ 
			spec 
				file: 'Alien-MacOSX-Pharo-EstebanLorenzano.1';
				repository: 'http://www.squeaksource.com/Alien' ].
			
	spec group: 'ObjCBridge' 
		with: #('Alien-MacOSX-Core' 'Alien-MacOSX-Pharo')