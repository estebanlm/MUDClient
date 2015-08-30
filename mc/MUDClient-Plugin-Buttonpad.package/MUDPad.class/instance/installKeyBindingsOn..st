as yet unclassified
installKeyBindingsOn: category
	self hasModifier ifFalse: [ ^ self ].
	self commands 
		select: #isDefined
		thenDo: [ :each | 
			category addKeymapEntry: (KMKeymap 
				shortcut: each keyBinding 
				action: [ each executeFor: category owner ] ) ]