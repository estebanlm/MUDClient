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
				title: 'Map';
				morph: [ self mapMorph ];
				morphTransmissions: [ :presentation |
					self mapMorph 
						onSelect: [ :aRoom | presentation selection: aRoom ] ] ].
			
	browser transmit 	
		from: #map;
		to: #roomDetail;
		andShow: [ :a |
			a tkMagritte  
				title: 'Detail';
				presenter: #view;
				beReadOnly ].
			
	browser transmit 
		from: #map;
		to: #roomNotes;
		andShow: [ :a |
			a text
				title: 'Notes';
				display: [ :room | room notes ifNil: [ '' ] ];
				onChangeOfPort: #text act: [ :presentation :room | 
					self 
						storeNote: presentation text asString 
						on: room ] ]