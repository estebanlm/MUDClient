initialization
initialize
	super initialize.
	dependentWindows := Set new.
	previousGame := self browserSettings lastActiveGame.
	self subscribeToAnnouncements