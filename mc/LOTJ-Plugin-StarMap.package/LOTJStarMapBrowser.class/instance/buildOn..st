building
buildOn: browser
	browser 
		column: #map span: 2;
		column: [ :column |
			column 
				row: #pointDetail;
				row: #pointNotes ].
		
	browser transmit 
		to: #map;
		andShow: [ :a |
			a tkMorph
				title: 'Map';
				morph: [ 
					ScrollPane new
						in: [ :this | | morph |
							morph := self starMapMorph.
							this scroller addMorph: morph ];
						hResizing: #spaceFill;
						vResizing: #spaceFill;
						yourself ];
				morphTransmissions: [ :presentation |
					self starMapMorph 
						onSelect: [ :aPoint | presentation selection: aPoint ] ].
			a fastList 
				title: 'List';
				display: [ self plugin points asArray ] ].
			
	browser transmit 	
		from: #map;
		to: #pointDetail;
		andShow: [ :a |
			a tkMagritte  
				title: [ :point | point type ];
				beReadOnly ].
			
	browser transmit 
		from: #map;
		to: #pointNotes;
		andShow: [ :a |
			a text
				title: 'Notes';
				display: [ :point | point notes ifNil: [ '' ] ];
				onChangeOfPort: #text act: [ :presentation :point | point notes: presentation text ] ]