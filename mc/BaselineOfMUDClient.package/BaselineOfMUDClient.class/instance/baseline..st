accessing
baseline: spec 
	<baseline>
	
	spec for: #pharo do: [
		self logger: spec.
		self voyage: spec.
		self petitParser: spec.
		self telnet: spec.
		self magritte3: spec.
		self glamour: spec.
		self toolkit: spec.
		self sound: spec.
		
		spec
			package: 'MUDClient-Protocol';
			package: 'MUDClient' with: [
				spec requires: #(
					'MUDClient-Protocol'
					'Logger'
					'Voyage'
					'PetitParser' 
					'TelnetSessionBasic' 
					'Magritte3' 
					'Glamour'
					'Toolkit') ];
			package: 'MUDClient-Plugin-Alias' with: [ spec requires: #('MUDClient') ];
			package: 'MUDClient-Plugin-Notepad' with: [ spec requires: #('MUDClient') ];
			package: 'MUDClient-Plugin-Buttonpad' with: [ spec requires: #('MUDClient') ];
			package: 'MUDClient-Plugin-LogViewer' with: [ spec requires: #('MUDClient') ];
			package: 'MUDClient-Plugin-Filter' with: [ spec requires: #('MUDClient' 'Sound') ];
			package: 'MUDClient-Plugin-CombatBar' with: [ spec requires: #('MUDClient') ];
			package: 'MUDClient-Tests' with: [ spec requires: #('MUDClient') ];
			package: 'MUDClient-Protocol-Tests' with: [ spec requires: #('MUDClient-Tests') ].

		spec 
			group: 'default' with: #('core' 'plugins' 'tests');
			group: 'core' with: #('MUDClient' 'MUDClient-Protocol');
			group: 'plugins' with: #(
				'core' 
				'MUDClient-Plugin-Alias'
				'MUDClient-Plugin-Notepad' 
				'MUDClient-Plugin-Buttonpad' 
				'MUDClient-Plugin-LogViewer'
				'MUDClient-Plugin-Filter'
				'MUDClient-Plugin-CombatBar');
			group: 'tests' with: #('core' 'MUDClient-Tests' 'MUDClient-Protocol-Tests') ]