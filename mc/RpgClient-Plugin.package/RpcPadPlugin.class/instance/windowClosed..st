execute
windowClosed: ann
	| browser gamePad |
	
	browser := openPads detect: [ :each | each window = ann window ].
	gamePad := RpcGamePad findByGameCreateIfAbsent: browser pad.
	openPads remove: browser.
	gamePad remove: browser pad