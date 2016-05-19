descriptions
descriptionText
	<magritteDescription>
	
	^ MAMemoDescription new 
		priority: 10;
		label: 'Definition';
		accessor: #text;
		lineCount: 3;
		beRequired;
		yourself