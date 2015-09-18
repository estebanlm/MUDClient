private
presentationActivated: ann 
 	activeFilter := (areaMorphs keyAtValue: ann presentation displayValue).
	self dirtiesAt: activeFilter put: false.