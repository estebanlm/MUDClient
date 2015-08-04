as yet unclassified
installKeyBindingsOn: category 
	self windows do: [ :each | 
		each model ifNotNil: [ :model | model installKeyBindingsOn: category ] ]