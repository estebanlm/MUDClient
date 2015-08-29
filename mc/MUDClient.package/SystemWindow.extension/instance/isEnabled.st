*MUDClient
isEnabled
	^ self submorphs isEmpty 
		or: [ ((self submorphs first valueOfProperty: #disabledArea) = true) not ]