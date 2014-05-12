accessing
magritte3: spec
	spec project: 'Magritte3' with: [ 
		spec
			className: 'ConfigurationOfMagritte3';
			versionString: '3.2'; "I do not like this way"
			loads: #('Core' 'Magritte-Morph');
			repository: 'http://smalltalkhub.com/mc/Magritte/Magritte3/main' ]
