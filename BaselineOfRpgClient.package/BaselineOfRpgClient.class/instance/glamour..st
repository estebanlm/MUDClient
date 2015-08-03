accessing
glamour: spec
	spec project: 'Glamour' with: [ 
		spec
			className: 'ConfigurationOfGlamour';
			versionString: #'stable'; 
			loads: #("'Core' 'Morphic'"'Glamour-Magritte-Presentations');
			repository: 'http://smalltalkhub.com/mc/Moose/Glamour/main' ]