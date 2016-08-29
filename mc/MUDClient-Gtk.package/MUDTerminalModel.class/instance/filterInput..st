private
filterInput: aString 
	| filtered |
	filtered := aString.
	self activePlugins 
		do: [ : each | filtered := each filterOn: self input: filtered ].
	^ filtered