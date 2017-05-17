building
buildOn: browser
	browser 
		column: #map span: 2;
		column: #pointDetail.
		
	browser transmit 
		to: #map;
		andShow: [ :a |
			a morph
				title: 'Map';
				morph: [ 
					ScrollPane new
						in: [ :this | | morph |
							morph :=self starMapMorph.
							this scroller addMorph: morph.
							morph onSelect: [ :aPoint | a selection: aPoint ] ];
						hResizing: #spaceFill;
						vResizing: #spaceFill;
						yourself ].
			a fastList 
				title: 'List';
				display: [ self plugin points asArray ] ].
			
	browser transmit 
		from: #map;
		from: #map port: #rawSelection;
		to: #pointDetail;
		andShow: [ :a :point |
			a morph 
				display: [ (point asMorphFor: #view) morph ] ]