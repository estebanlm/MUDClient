execute
openPadBrowserFor: aPad
	| padBrowser |
	padBrowser := RpcPadBrowser plugin: self pad: aPad.
	padBrowser open.
	padBrowser window announcer
		when: WindowClosed send: #windowClosed: to: self.
	openPads add: padBrowser