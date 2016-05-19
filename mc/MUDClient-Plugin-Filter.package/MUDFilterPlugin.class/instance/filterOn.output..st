filtering
filterOn: aTerminal output: aString
	"This is the algorithm idea. 
	 for each line (filter applies by line) we strip its ANSI formatting (filter does not 
	 apply by format) then we check if filter pattern matchs and in that case we took it 
	 out, sending the filtered line to its channel"
	| result |

	result := String
		new: aString size
		streamContents: [ :stream | 
			self 
				filterTo: stream 
				output: aString
				in: aTerminal ].

	^ (result allSatisfy: #isSeparator)
		ifTrue: [ '' ]
		ifFalse: [ result ]