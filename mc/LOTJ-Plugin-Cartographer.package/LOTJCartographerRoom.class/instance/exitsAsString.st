private
exitsAsString
	^ String streamContents: [ :stream | 
		self exits
			do: [ :each | stream << each label ]
			separatedBy: [ stream << ', ' ] ]