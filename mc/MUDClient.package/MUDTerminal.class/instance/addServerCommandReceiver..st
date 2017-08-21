private
addServerCommandReceiver: aServerCommand
	self flag: #todo. "I'm trying how it feels just keeping last command that needs update 
	in the stack. If this works, I need to refactor this."
	^ self serverCommandReceivers 
		removeAll; 
		add: aServerCommand