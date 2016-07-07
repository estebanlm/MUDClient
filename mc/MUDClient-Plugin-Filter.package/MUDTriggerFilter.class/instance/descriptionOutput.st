descriptions
descriptionOutput
	<magritteDescription>
	
	^ MAMemoDescription new 
		priority: 100;
		label: 'Output';
		accessor: #output;
		lineCount: 8;
		beRequired;
		yourself