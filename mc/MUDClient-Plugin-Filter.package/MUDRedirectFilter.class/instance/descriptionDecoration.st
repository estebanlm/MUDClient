descriptions
descriptionDecoration
	<magritteDescription>
	
	^ MASingleOptionDescription new
		priority: 120;
		label: 'Decoration';
		accessor: #decoration;
		options: self class availableDecorations;
		reference: (MAStringDescription new accessor: #name; asContainer); 
		morphClass: MADropListMorph;
		yourself