showing
open 
	self flag: #todo. "This is a hack, but no better place to clean it :("
	RubFindReplaceService reset.
	
	window := self buildBrowser openOn: Object new.
	window announcer
		when: WindowActivated send: #takeKeyboardFocus to: inputMorph;
		when: WindowClosed send: #closeSession to: self.
	inputMorph takeKeyboardFocus.
	window disable.
	self connect.
