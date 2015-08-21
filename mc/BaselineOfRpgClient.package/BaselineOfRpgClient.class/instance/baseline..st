accessing
baseline: spec 
	<baseline>
	
	spec for: #pharo do: [
		self logger: spec.
		self voyage: spec.
		self petitParser: spec.
		self telnet: spec.
		self rubric: spec.
		self magritte3: spec.
		self glamour: spec.
		
		spec
			package: 'Glamour-FastTable' with: [ 
				spec 
					repository: 'http://smalltalkhub.com/mc/estebanlm/FastTable/main';
					requires: #('Glamour') ]; 
			package: 'RpgClient' with: [
				spec requires: #(
					'Logger'
					'Voyage'
					'PetitParser' 
					'TelnetSessionBasic' 
					'Rubric' 
					'Magritte3' 
					'Glamour'
					'Glamour-FastTable') ];
			package: 'RpgClient-Protocol' with: [ 
				spec requires: #('RpgClient') ];
			package: 'RpgClient-Plugin' with: [ 
				spec requires: #('RpgClient') ];
			package: 'RpgClient-Tests' with: [ 
				spec requires: #('RpgClient') ];
			package: 'RpgClient-Protocol-Tests' with: [ 
				spec requires: #('RpgClient-Tests') ];
			package: 'RpgClient-Plugin-Tests' with: [ 
				spec requires: #('RpgClient-Tests') ].

		spec 
			group: 'default' with: #('core' 'plugins' 'tests');
			group: 'core' with: #('RpgClient' 'RpgClient-Protocol');
			group: 'plugins' with: #('core' 'RpgClient-Plugin');
			group: 'tests' with: #('core' 'RpgClient-Tests' 'RpgClient-Protocol-Tests' 'RpgClient-Plugin-Tests') ]