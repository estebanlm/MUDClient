processing
processNext: command
	| data |

	command = SB ifFalse: [ 
		TelnetInvalidCommand new 
			command: command;
			signal ].
	
	data := self nextCommand: command.	
	self log debug: [ 'Received command: {1}' format: { data } ].
	self deactivate. 
	self session announce: (MUDMSDPCommandReceived new
		protocol: MSDP;
		data: data;
		variable: (self parser parse: data asString);
		yourself)