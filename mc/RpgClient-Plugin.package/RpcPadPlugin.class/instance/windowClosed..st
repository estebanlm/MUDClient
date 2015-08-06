execute
windowClosed: ann
	| browser buttonpad |
	
	browser := openPads detect: [ :each | each window = ann window ].
	buttonpad := browser game buttonpad.
	openPads remove: browser.
	buttonpad remove: browser pad