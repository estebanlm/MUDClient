building
buildBrowser 
	| browser |
	
	browser := GLMTabulator new
		title: self class title;
		in: [ :me | self buildToolBarOn: me ];
		row: #console;
		row: #input size: 40;
		yourself.
				
	browser transmit to: #console; andShow: [ :a | a rubricText ].
	browser transmit to: #input; andShow: [ :a | a text ].
				
	^ browser