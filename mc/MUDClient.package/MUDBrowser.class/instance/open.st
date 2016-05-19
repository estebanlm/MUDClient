showing
open
	"Creates and open window"
	self startOn: self startValue.
	self window: (TkPlatform current renderBrowser: self).
	self window announcer
		when: WindowOpened send: #windowOpened: to: self;
		when: WindowClosed send: #windowClosed: to: self.
	self window tkOpen.
	self postOpen