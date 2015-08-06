private
closeSessionAndCleanUpDisplay
	"Console has been closed through the button. We perform some cleanups needed when it happens.
	 NOTE: When it arrives here, it is already closed and activeGame (and #game) is already released. 
	 So I need to clean up last active game"
	self closeSession.
	self client cleanUpLastActiveGameDisplay.