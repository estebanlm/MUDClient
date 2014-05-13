building
buildBrowser
	| browser |
	
	browser := GLMTabulator new 
		row: [ :row |
			row 
				column: #games;
				column: #currentGame ];
		row: #actions size: 35;
		yourself.
		
	browser transmit 
		to: #games;
		andShow: [ :a | self buildGamesOn: a ].
		
	browser transmit
		from: #games;
		to: #currentGame;
		andShow: [ :a | self buildCurrentGameOn: a ].
		
	browser transmit 
		to: #actions;
		andShow: [ :a | 
			a actionList
				act: [ self inform: 'Please select an game' ] entitled: 'Accept';
				act: [ window close ] entitled: 'Cancel'. ].

	"Actions"
	browser transmit 
		to: #actions;
		andShow: [ :a | 
			a actionList
				act: [ self inform: 'Please select an element' ] entitled: 'Accept';
				act: [ window close ] entitled: 'Cancel'. ].
			
	browser transmit 
		from: #games;
		to: #actions;
		andShow: [ :a | 
			a actionList
				act: [ :presenter :selection | 
					value := selection.
					window close ] 
					entitled: 'Accept';
				act: [ window close ] entitled: 'Cancel'. ].

	^ browser