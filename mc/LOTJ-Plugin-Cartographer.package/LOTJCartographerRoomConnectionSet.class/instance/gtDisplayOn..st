inspecting
gtDisplayOn: stream 
	stream << '['.
	self rooms 
		do: [ :each | each gtDisplayOn: stream  ]
		separatedBy: [ stream << ', ' ].
	stream << ']'