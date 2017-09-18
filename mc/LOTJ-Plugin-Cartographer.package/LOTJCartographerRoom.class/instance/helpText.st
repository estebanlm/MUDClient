accessing
helpText
	^ String streamContents: [ :stream | 
		stream << self name.
		self type isNone 
			ifFalse: [ stream << ' [' << self type label << ']' ].
		self notes isEmptyOrNil 
			ifFalse: [ stream << String cr << self notes ] ]