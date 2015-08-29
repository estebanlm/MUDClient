descriptions
descriptionCommand
	<magritteDescription>
	
	^ MAMemoDescription new 
		priority: 10;
		label: 'Definition';
		accessor: #(command text);
		lineCount: 8;
		beRequired;
		yourself