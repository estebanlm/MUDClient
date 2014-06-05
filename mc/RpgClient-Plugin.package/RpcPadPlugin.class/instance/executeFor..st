execute
executeFor: aClient 
	| gamePad browser |
	
	gamePad := RpcGamePad findByGameCreateIfAbsent: aClient.
	browser := RpcPadBrowser client: aClient pad: gamePad addNew.
	browser open.
	browser window announcer
		when: WindowClosed send: #windowClosed: to: self.
	openPads add: browser.
	