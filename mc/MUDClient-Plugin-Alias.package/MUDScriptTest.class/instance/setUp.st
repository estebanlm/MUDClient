accessing
setUp
	game := MUDGameForTest new.
	terminal := MUDTerminalForTest new. 
	terminal connectTo: game.
	script := MUDScript on: terminal.