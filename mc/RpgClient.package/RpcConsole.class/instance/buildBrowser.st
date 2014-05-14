building
buildBrowser 
	| browser |
		
	browser := GLMTabulator new
		title: self class title;
		initialExtent: 680@680;
		in: [ :me | self buildToolBarOn: me ];
		row: #area;
		row: #input size: 40;
		yourself.
				
	browser transmit 
		to: #area; 
		andShow: [ :a | a morph morph: (areaMorph := self createAreaMorph) ].
	browser transmit 
		to: #input; 
		andShow: [ :a | a morph morph: (inputMorph := self createInputMorph) ].
				
	^ browser