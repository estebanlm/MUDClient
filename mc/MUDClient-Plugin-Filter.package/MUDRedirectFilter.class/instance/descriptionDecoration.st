descriptions
descriptionDecoration
	<magritteDescription>
	
	^ MASingleOptionDescription new
		priority: 110;
		label: 'Decoration';
		accessor: #dcoration;
		options: self class availableDecorations;
		reference: (MAStringDescription new accessor: #name); 
		morphClass: MADropListMorph;
		yourself