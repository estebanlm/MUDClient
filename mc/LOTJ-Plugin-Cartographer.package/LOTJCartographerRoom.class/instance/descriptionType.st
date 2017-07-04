descriptions
descriptionType
	<magritteDescription>
	<presenters: #(inspect view)>
	
	^ MASingleOptionDescription new
		priority: 40;
		label: 'Type';
		accessor: #type;
		options: LOTJCartographerRoomType allTypes;
		reference: LOTJCartographerRoomType default descriptionLabel asContainer; 
		morphClass: MADropListMorph;
		beRequired;
		yourself