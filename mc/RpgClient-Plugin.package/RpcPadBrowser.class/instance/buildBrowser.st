building
buildBrowser 
	| browser |

	browser := GLMTabulator new 
		title: [ '{1} (Using: {2})' format: { self pad name. self pad modifier ifNil: [ 'None' ]} ];
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
			self padCommands do: [ :each | 
				actionList 
					act: [ :presenter | self execute: each then: [ presenter update ] ] 
					entitled: [ each title ifNil: [ '' ] ]
					help: each help ] ].

	^ browser