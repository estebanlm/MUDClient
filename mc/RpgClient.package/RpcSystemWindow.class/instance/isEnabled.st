testing
isEnabled
	^ self contentMorph submorphs isEmpty 
		or: [ ((self contentMorph submorphs first valueOfProperty: #disabledArea) = true) not ]