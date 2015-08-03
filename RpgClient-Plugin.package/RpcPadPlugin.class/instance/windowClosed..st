execute
windowClosed: ann
	| browser gamePad |
	
	browser := openPads detect: [ :each | each window = ann window ].
	gamePad := RpcGamePad findByGameCreateIfAbsent: browser game.
	openPads remove: browser.
	gamePad remove: browser pad