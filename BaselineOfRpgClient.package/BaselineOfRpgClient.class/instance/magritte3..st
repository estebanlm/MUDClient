accessing
magritte3: spec
	spec project: 'Magritte3' with: [ 
		spec
			className: 'ConfigurationOfMagritte3';
			versionString: '3.3.2';
			loads: #('Core' 'Magritte-Morph');
			repository: 'http://smalltalkhub.com/mc/Magritte/Magritte3/main' ]
