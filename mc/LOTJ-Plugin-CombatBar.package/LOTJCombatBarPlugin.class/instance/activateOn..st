private
activateOn: aTerminal
	"Send reportable variables"
	(MUDServerMSDPReportCommand on: aTerminal)
		variables: self reportVariables;
		execute