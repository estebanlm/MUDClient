private protocol
buildCommand
	^ MUDMSDPCommandBuilder subcommand: [ :command | 
		command var: self commandName.
		self variables do: [ :each | command put: each ] ]
