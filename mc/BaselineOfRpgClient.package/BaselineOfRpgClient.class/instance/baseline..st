accessing
baseline: spec 
	<baseline>
	
	spec for: #pharo do: [
		spec repository: 'filetree://repository/mc'. 
		
		self magritte3: spec.
		self glamour: spec.
		
		spec 
			package: 'Rpg-Client';
			package: 'Rpg-Client-Tests' ].