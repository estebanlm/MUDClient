accessing
baseline: spec 
	<baseline>
	
	spec for: #pharo do: [
		spec repository: 'filetree://repository/mc'. 
		
		self petitParser: spec.
		self telnet: spec.
		self rubric: spec.
		self magritte3: spec.
		self glamour: spec.
		
		spec 
			package: 'Rpg-Telnet-Client' with: [
				spec requires: #('PetitParser' 'TelnetSessionBasic' 'Rubric' 'Magritte3' 'Glamour') ] ].