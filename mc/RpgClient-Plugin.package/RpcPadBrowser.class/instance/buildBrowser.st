building
buildBrowser 
	| browser |
	
	browser := GLMTabulator new 
		title: [ self pad name ];
		initialExtent: (horizontal 
			ifTrue: [ self class horizontalExtent ]
			ifFalse: [ self class verticalExtent ]);
		in: [ :me | self buildToolBarOn: me ];
		perform: (horizontal ifTrue: [ #row: ] ifFalse: [ #column: ]) with: #commands;
		yourself.

	browser transmit 
		to: #commands;
		andShow: [ :a | | actionList |
			actionList := a padActionList horizontal: horizontal.
			self pad commands do: [ :each | 
				actionList 
					act: [ :presenter |
						self 
							execute: each
							onChange: [ presenter update ] ] 
					entitled: [ each text ifNil: [ '' ] ] ] ].

	^ browser