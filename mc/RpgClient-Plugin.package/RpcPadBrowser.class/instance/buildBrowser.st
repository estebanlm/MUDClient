building
buildBrowser 
	| browser |
	
	browser := GLMTabulator new 
		title: [ self pad name ];
		row: #commands;
		yourself.
		
	browser transmit 
		to: #commands;
		andShow: [ :a | | actionList |
			actionList := a padActionList.
			self pad commands do: [ :each | 
				actionList 
					act: [ :presenter |
						self 
							execute: each
							onChange: [ presenter update ] ] 
					entitled: [ each text ifNil: [ '' ] ] ] ].

	^ browser