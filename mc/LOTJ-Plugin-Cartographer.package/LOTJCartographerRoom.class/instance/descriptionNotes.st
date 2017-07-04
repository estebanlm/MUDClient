descriptions
descriptionNotes
	<magritteDescription>
	<presenters: #(inspect)>
	
	^ MAMemoDescription new 
		priority: 100;
		label: 'Notes';
		accessor: #notes;
		lineCount: 8;
		yourself