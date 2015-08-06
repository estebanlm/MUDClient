as yet unclassified
installKeyBindingsOn: category
	self pad hasModifier ifFalse: [ ^ self ].
	self padCommands 
		select: #isDefined
		thenDo: [ :each | 
			category addKeymapEntry: (KMKeymap
				shortcut: each keyBinding
				action: [ each executeFor: self client ]) ]