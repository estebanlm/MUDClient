building
buildBrowser
	| browser |
	
	browser := GLMTabulator new 
		title: self class title;
		initialExtent: self preferredExtent;
		row: [ :row |
			row 
				column: #objects;
				column: #currentObject ];
		row: #actions size: 35;
		yourself.
		
	browser transmit 
		to: #objects;
		andShow: [ :a | self buildObjectsOn: a ].
		
	browser transmit
		from: #objects;
		to: #currentObject;
		andShow: [ :a | self buildCurrentObjectOn: a ].
		
	"Actions"
	browser transmit 
		to: #actions;
		andShow: [ :a | 
			a tkActionList
				act: [ window close ] 
					icon: #cancel asMUDIcon
					entitled: 'Cancel';
				act: [ self inform: 'Please select one element first!' ] 
					icon: #accept asMUDIcon
					entitled: 'Accept' ].

	browser transmit 
		from: #objects;
		to: #actions;
		andShow: [ :a | 
			a tkActionList
				act: [ window close ] 
					icon: #cancel asMUDIcon
					entitled: 'Cancel';
				act: [ :presenter :selection | value := selection. window close ] 
					icon: #accept asMUDIcon
					entitled: 'Accept' ].

	^ browser