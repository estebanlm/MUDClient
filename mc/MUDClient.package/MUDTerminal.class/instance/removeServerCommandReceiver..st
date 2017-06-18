private
removeServerCommandReceiver: aReceiver
	^ serverCommandReceivers 
		remove: aReceiver
		ifAbsent: [  ]