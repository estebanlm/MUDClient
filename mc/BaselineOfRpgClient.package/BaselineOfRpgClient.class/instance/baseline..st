accessing
baseline: spec 
	<baseline>
	
	spec for: #pharo do: [
		spec repository: 'filetree://repository/mc'. 
		
		self voyage: spec.
		self petitParser: spec.
		self telnet: spec.
		self rubric: spec.
		self magritte3: spec.
		self glamour: spec.
		
		spec 
			package: 'RpgClient' with: [
				spec requires: #(
					'Voyage'
					'PetitParser' 
					'TelnetSessionBasic' 
					'Rubric' 
					'Magritte3' 
					'Glamour') ];
			package: 'RpgClient-Protocol' with: [ 
				spec requires: #('RpgClient') ];
			package: 'RpgClient-Tests' with: [ 
				spec requires: #('RpgClient') ];
			package: 'RpgClient-Protocol-Tests' with: [ 
				spec requires: #('RpgClient-Tests') ].

		spec 
			group: 'default' with: #('core' 'tests');
			group: 'core' with: #('RpgClient' 'RpgClient-Protocol');
			group: 'tests' with: #('RpgClient-Tests' 'RpgClient-Protocol-Tests') ]