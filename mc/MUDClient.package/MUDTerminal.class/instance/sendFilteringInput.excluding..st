accessing send
sendFilteringInput: aString excluding: aPlugin
	"Apply any filters transformations (excluding aPlugin), so we can use, for example, 
	 aliases and variables"
	| output |
	output := aString.
	self activePlugins 
		reject: [ :each | each = aPlugin ]
		thenDo: [ :each | output := each filterOn: self input: output ]. 
	self send: output