private
buildCommand
	^ MUDMSDPCommandBuilder new 
		subcommand: [ :command | 
			command var: 'REPORT'.  
			self variables do: [ :each | command put: each ] ];
		contents