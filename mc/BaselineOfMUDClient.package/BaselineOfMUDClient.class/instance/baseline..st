accessing
baseline: spec 
	<baseline>
	
	spec for: #pharo do: [
		self logger: spec.
		self themes: spec.
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
					'Themes'
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
			package: 'MUDClient-Tests' with: [ spec requires: #('MUDClient') ];
			package: 'MUDClient-Protocol-Tests' with: [ spec requires: #('MUDClient-Tests') ];
			"LOTJ"
			package: 'LOTJ-Plugin-CombatBar' with: [ spec requires: #('MUDClient') ];
			package: 'LOTJ-Plugin-StarMap' with: [ spec requires: #('MUDClient') ].

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