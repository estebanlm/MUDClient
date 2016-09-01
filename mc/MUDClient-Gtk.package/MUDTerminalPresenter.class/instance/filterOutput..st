private
filterOutput: aString 
	| filtered |
	filtered := aString.
	self activePlugins
		do: [ : each | filtered := each filterOn: self output: filtered ].
	^ filtered