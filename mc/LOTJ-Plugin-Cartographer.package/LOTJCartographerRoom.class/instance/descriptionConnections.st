descriptions
descriptionConnections
	<magritteDescription>
	
	^ MAToManyRelationDescription new 
		priority: 30;
		label: 'Connections';
		accessor: #connections;
		reference: LOTJCartographerRoomConnection basicNew descriptionLabel asContainer;
		morphClass: TkOneToManyFastListMorph;
		tkRowsToShow: 4;
		beReadonly;
		yourself