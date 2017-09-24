Class {
	#name : #BaselineOfMUDClient,
	#superclass : #BaselineOf,
	#category : 'BaselineOfMUDClient'
}

{ #category : #accessing }
BaselineOfMUDClient >> baseline: spec [ 
	<baseline>
	
	spec for: #pharo do: [
		self logger: spec.
		self themes: spec.
		self taskIt: spec.
		self voyage: spec.
		self petitParser: spec.
		self telnet: spec.
		self magritte3: spec.
		self glamour: spec.
		self toolkit: spec.
		self sound: spec.
		self objCBridge: spec.
		
		spec
			package: 'MUDClient-Protocol';
			package: 'MUDClient' with: [
				spec requires: #(
					'MUDClient-Protocol'
					'Logger'
					'Themes'
					'TaskIt'
					'Voyage'
					'PetitParser' 
					'TelnetClient' 
					'Magritte3' 
					'Glamour'
					'Toolkit') ];
			package: 'MUDClient-Plugin-Alias' with: [ spec requires: #('MUDClient') ];
			package: 'MUDClient-Plugin-Notepad' with: [ spec requires: #('MUDClient') ];
			package: 'MUDClient-Plugin-Buttonpad' with: [ spec requires: #('MUDClient') ];
			package: 'MUDClient-Plugin-LogViewer' with: [ spec requires: #('MUDClient') ];
			package: 'MUDClient-Plugin-Filter' with: [ 
				spec requires: #('MUDClient' 'Sound' 'ObjCBridge') ];
			package: 'MUDClient-Tests' with: [ spec requires: #('MUDClient') ];
			package: 'MUDClient-Protocol-Tests' with: [ spec requires: #('MUDClient-Tests') ];
			"LOTJ"
			package: 'LOTJ-Base' with: [ spec requires: #('MUDClient') ];
			package: 'LOTJ-Plugin-CombatBar' with: [ spec requires: #('MUDClient' 'LOTJ-Base') ];
			package: 'LOTJ-Plugin-StarMap' with: [ spec requires: #('MUDClient' 'LOTJ-Base') ];
			package: 'LOTJ-Plugin-Cartographer' with: [ spec requires: #('MUDClient' 'LOTJ-Base') ].

		spec 
			group: 'default' with: #('core' 'plugins' 'LOTJ' 'tests');
			group: 'core' with: #('MUDClient' 'MUDClient-Protocol');
			group: 'plugins' with: #(
				'core' 
				'MUDClient-Plugin-Alias'
				'MUDClient-Plugin-Notepad' 
				'MUDClient-Plugin-Buttonpad' 
				'MUDClient-Plugin-LogViewer'
				'MUDClient-Plugin-Filter');
			group: 'LOTJ' with: #('LOTJ-Plugin-CombatBar' 'LOTJ-Plugin-StarMap');	
			group: 'tests' with: #('core' 'MUDClient-Tests' 'MUDClient-Protocol-Tests') ] 
]

{ #category : #'external projects' }
BaselineOfMUDClient >> glamour: spec [
	spec project: 'Glamour' with: [ 
		spec
			className: 'ConfigurationOfGlamour';
			versionString: #'stable'; 
			loads: #("'Core' 'Morphic'"'Glamour-Magritte-Presentations');
			repository: 'http://smalltalkhub.com/mc/Moose/Glamour/main' ]
]

{ #category : #'external projects' }
BaselineOfMUDClient >> logger: spec [
	spec
		baseline: 'Logger' with: [ 
			spec repository: 'github://estebanlm/logger:master' ];
		import: 'Logger'
]

{ #category : #'external projects' }
BaselineOfMUDClient >> magritte3: spec [
	spec project: 'Magritte3' with: [ 
		spec
			className: 'ConfigurationOfMagritte3';
			loads: #('Core' 'Magritte-Morph');
			repository: 'http://smalltalkhub.com/mc/Magritte/Magritte3/main' ]

]

{ #category : #'external projects' }
BaselineOfMUDClient >> objCBridge: spec [
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
]

{ #category : #'external projects' }
BaselineOfMUDClient >> petitParser: spec [
	spec project: 'PetitParser' with: [
		spec 
			repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main';
			className: 'ConfigurationOfPetitParser';
			loads: #('Core' 'Tests' 'PetitXml' 'PetitJson' 'PetitXPath') ].
]

{ #category : #'external projects' }
BaselineOfMUDClient >> sound: spec [
	spec project: 'Sound' with: [ 
		spec
			className: 'ConfigurationOfPharoSound';
			versionString: #'stable'; 
			repository: 'http://smalltalkhub.com/mc/PharoExtras/Sound/main' ]
]

{ #category : #'external projects' }
BaselineOfMUDClient >> taskIt: spec [
	spec
		baseline: 'TaskIt' with: [ 
			spec repository: 'github://sbragagnolo/TaskIt:master' ];
		import: 'TaskIt'
]

{ #category : #'external projects' }
BaselineOfMUDClient >> telnet: spec [
	spec 
		baseline: 'TelnetClient' with: [
			spec repository: 'github://estebanlm/telnet-client:master' ];
		import: 'TelnetClient'
]

{ #category : #'external projects' }
BaselineOfMUDClient >> themes: spec [
	spec
		baseline: 'Themes' with: [ 
			spec repository: 'github://estebanlm/themes:master/mc' ];
		import: 'Themes'
]

{ #category : #'external projects' }
BaselineOfMUDClient >> toolkit: spec [
	spec
		baseline: 'Toolkit' with: [ 
			spec repository: 'github://estebanlm/toolkit:0.1/mc' ];
		import: 'Toolkit'
]

{ #category : #'external projects' }
BaselineOfMUDClient >> voyage: spec [
	spec
		baseline: 'Voyage' with: [ 
			spec 
				loads: 'memory';
				repository: 'github://estebanlm/voyage/mc' ];
		import: 'Voyage'
]
