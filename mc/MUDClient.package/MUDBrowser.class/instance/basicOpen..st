showing
basicOpen: aWindow
	self window: aWindow.
	self window extent: self preferredExtent.
	self window announcer
		when: WindowOpened send: #windowOpened: to: self;
		when: WindowWillClose send: #windowWillClose: to: self;
		when: WindowClosed send: #windowClosed: to: self.
	self window tkOpen.
	self postOpen