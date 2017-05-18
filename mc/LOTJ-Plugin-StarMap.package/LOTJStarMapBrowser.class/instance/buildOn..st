building
buildOn: browser
	browser 
		column: #map span: 2;
		column: #pointDetail.
		
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
		from: #map port: #rawSelection;
		to: #pointDetail;
		andShow: [ :a |
			a tkMagritte  
				title: [ :point | point type ] ]