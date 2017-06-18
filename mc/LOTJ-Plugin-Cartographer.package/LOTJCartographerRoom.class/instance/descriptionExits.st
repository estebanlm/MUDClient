descriptions
descriptionExits
	<magritteDescription>
	
	^ MAToManyRelationDescription new 
		priority: 20;
		label: 'Exits';
		accessor: #exits;
		reference: LOTJCartographerDirection basicNew descriptionLabel asContainer;
		morphClass: TkOneToManyFastListMorph;
		tkRowsToShow: 4;
		beReadonly;
		yourself
