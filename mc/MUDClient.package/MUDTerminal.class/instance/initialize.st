initialization
initialize
	super initialize.
	dependentWindows := Set new.
	outputScheduler := TKTNewProcessTaskRunner new.
	self subscribeToAnnouncements