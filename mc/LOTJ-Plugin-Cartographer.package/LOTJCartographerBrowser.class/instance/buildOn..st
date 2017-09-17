building
buildOn: browser
	browser 
		column: #map span: 2;
		column: [ :column |
			column 
				row: #roomDetail;
				row: #roomNotes ].
		
	browser transmit 
		to: #map;
		andShow: [ :a |
			a tkMorph
				"title: 'Map';"
				act: [ :p | 
					self exportLevelMap: (p selection ifNil: [ self plugin actualRoom ]) ] 
					entitled: 'Export map';
				act: [ self removeLevel ] entitled: 'Remove level';
				act: [ :p | 
					self removeAllConnections: (p selection ifNil: [ self plugin actualRoom ]) ] 
					entitled: 'Remove connections';
				morph: [ self mapMorph ];
				morphTransmissions: [ :presentation |
					self mapMorph 
						onSelect: [ :aRoom | presentation selection: aRoom ] ] ].
			
	browser transmit 	
		from: #map;
		to: #roomDetail;
		andShow: [ :a |
			a tkMagritte  
				"title: 'Detail';"
				presenter: #view;
				act: [ :each | each entity inspect ] 
					icon: #glamorousInspect asIcon 
					entitled: 'Inspect';
				onAnswer: [ :v | v ifNotNil: [ self mapMorph update ] ] ].
			
	browser transmit 
		from: #map;
		to: #roomNotes;
		andShow: [ :a |
			a text
				"title: 'Notes';"
				display: [ :room | room notes ifNil: [ '' ] ];
				onChangeOfPort: #text act: [ :presentation :room | 
					self 
						storeNote: presentation text asString 
						on: room ] ]