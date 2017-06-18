private
activateOn: aTerminal
	"Send reportable variables"
	(MUDServerMSDPReportCommand on: aTerminal)
		variables: self reportVariables;
		execute.
	"Send me the VNUM right now: I want to know where I am"
	(MUDMSDPSendCommand on: aTerminal)
		variables: ROOM_VNUM;
		execute. 
