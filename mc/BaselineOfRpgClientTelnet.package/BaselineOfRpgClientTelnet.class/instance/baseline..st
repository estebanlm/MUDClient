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
			package: 'RpgClient-Telnet' with: [
				spec requires: #(
					'Voyage'
					'PetitParser' 
					'TelnetSessionBasic' 
					'Rubric' 
					'Magritte3' 
					'Glamour') ];
			package: 'RpgClient-Telnet-Tests' with: [ 
				spec requires: #('RpgClient-Telnet') ].
			
		spec 
			group: 'default' with: #('core' 'tests');
			group: 'core' with: #('RpgClient-Telnet');
			group: 'tests' with: #('RpgClient-Telnet-Tests') ]