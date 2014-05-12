showing
open 
	window := self buildBrowser openOn: Object new.
	window announcer
		when: WindowActivated 
		send: #takeKeyboardFocus 
		to: inputMorph.
	inputMorph takeKeyboardFocus.
	window disable.
	self connect.
