accessing
cleanUpDisplay
	"Removes all windows from display. 
	 It is useful when changing an active game for other"
	self windows do: #silentlyDelete