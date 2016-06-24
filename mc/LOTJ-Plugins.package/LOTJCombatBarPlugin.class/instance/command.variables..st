private
command: aName variables: aCollection
	^ MUDMSDPCommandBuilder new 
		subcommand: [ :command | 
			command at: aName putList: [
				aCollection do: [ :each | 
					command put: each ] ] ];
		contents.
