as yet unclassified
installKeyBindingsOn: category 
	self windows
		select: [ :each | each browserModel notNil ]
		thenDo: [ :each | each browserModel installKeyBindingsOn: category ]