private
buildCommand
	^ MUDMSDPCommandBuilder subcommand: [ :command | 
		command at: self commandName put: self variableName ]
