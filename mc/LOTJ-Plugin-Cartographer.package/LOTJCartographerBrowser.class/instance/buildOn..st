building
buildOn: browser
	browser column: #map.
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
						onSelect: [ :aRoom | presentation selection: aRoom ] ] ]