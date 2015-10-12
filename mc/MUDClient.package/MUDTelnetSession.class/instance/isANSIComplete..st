private
isANSIComplete: buffer
	"This is a hacky way to check for ANSI completion without scaning all string. 
	 I assume that an ANSI escape will not be larger than 12... this is just a 
	 guessed number and maybe needs adjustement. 
	 Also Ijust check for terminal that I parse, which means that there can be non-completed
	 escapes and I will lose them, and break the full chain"
	| scanFrom command size ansiTerminal |
	
	ansiTerminal := #($m $J).
	size := buffer size.
	command := 0.
	scanFrom := size - (size min: 12) + 1.
	scanFrom to: size do: [ :i | | ch |
		ch := buffer at: i.
		ch = Character escape 
			ifTrue: [ command := command + 1 ].
		(command > 0 and: [ ansiTerminal includes: ch ]) 
			ifTrue: [ command := command - 1 ] ].
	
	^ command = 0