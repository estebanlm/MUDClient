private
ensureOpenWindow
	"Creates and open window"
	self startOn: self startValue.
	self window: (GLMRenderer renderer renderWindow: self).
	"self window announcer 
		when: RpcWindowDidOpen send: #windowOpened: to: self;
		when: RpcWindowWillClose send: #windowClosed: to: self."
	self window open