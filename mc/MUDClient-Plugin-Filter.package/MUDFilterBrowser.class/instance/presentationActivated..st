private
presentationActivated: ann 
 	activeFilter := (areaMorphs keyAtValue: ann presentation displayValue).
	(self dirtyAt: activeFilter) ifTrue: [
		self dirtyAt: activeFilter put: false.
		self announcer announce: MUDFilterUpdated new ]