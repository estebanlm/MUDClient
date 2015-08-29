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
			package: 'MUDClient' with: [
				spec requires: #(
					'Logger'
					'Voyage'
					'PetitParser' 
					'TelnetSessionBasic' 
					'Rubric' 
					'Magritte3' 
					'Glamour'
					'Glamour-FastTable') ];
			package: 'MUDClient-Protocol' with: [ 
				spec requires: #('MUDClient') ];
			package: 'MUDClient-Plugin' with: [ 
				spec requires: #('MUDClient') ];
			package: 'MUDClient-Tests' with: [ 
				spec requires: #('MUDClient') ];
			package: 'MUDClient-Protocol-Tests' with: [ 
				spec requires: #('MUDClient-Tests') ];
			package: 'MUDClient-Plugin-Tests' with: [ 
				spec requires: #('MUDClient-Tests') ].

		spec 
			group: 'default' with: #('core' 'plugins' 'tests');
			group: 'core' with: #('MUDClient' 'MUDClient-Protocol');
			group: 'plugins' with: #('core' 'MUDClient-Plugin');
			group: 'tests' with: #('core' 'MUDClient-Tests' 'MUDClient-Protocol-Tests' 'MUDClient-Plugin-Tests') ]