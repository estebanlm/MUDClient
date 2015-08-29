private
ensureOpenWindow
	"Creates and open window"
	self startOn: self startValue.
	self window: (GLMRenderer renderer renderWindow: self).
	self window announcer 
		when: WindowOpened send: #windowOpened: to: self;
		when: WindowClosed send: #windowClosed: to: self.
	self window open