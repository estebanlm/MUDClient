private
activateOn: aTerminal
	"Send reportable variables"
	aTerminal sendCommand: (MUDMSDPCommandBuilder new 
		subcommand: [ :command | 
			command at: REPORT putList: [
				self reportVariables do: [ :each | command put: each ] ] ];
		contents).
