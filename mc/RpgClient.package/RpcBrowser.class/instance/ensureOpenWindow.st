showing
ensureOpenWindow
	"Creates and open window"
	glamourBrowser := self buildBrowser.
	glamourBrowser startOn: 	self startValue.
	window := GLMRenderer renderer renderWindow: glamourBrowser.
	window announcer 
		when: RpcWindowDidOpen send: #windowOpened: to: self client;
		when: RpcWindowWillClose send: #windowClosed: to: self client.
	window open