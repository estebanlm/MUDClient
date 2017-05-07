descriptions
descriptionText
	<magritteDescription>
	
	^ MAMemoDescription new 
		priority: 10;
		label: 'Definition';
		accessor: #text;
		lineCount: 10;
		beRequired;
		yourself