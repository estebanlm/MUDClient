initialization
initialize
	super initialize.
	dependentWindows := WeakRegistry new.
	previousGame := self browserSettings lastActiveGame.