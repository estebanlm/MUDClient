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
			package: 'Rpg-Telnet-Client' with: [
				spec requires: #(
					'Voyage'
					'PetitParser' 
					'TelnetSessionBasic' 
					'Rubric' 
					'Magritte3' 
					'Glamour') ];
			package: 'Rpg-Telnet-Client-Tests' with: [ 
				spec requires: #('Rpg-Telnet-Client') ].
			
		spec 
			group: 'default' with: #('core' 'tests');
			group: 'core' with: #('Rpg-Telnet-Client');
			group: 'tests' with: #('Rpg-Telnet-Client-Tests') ]