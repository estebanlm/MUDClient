descriptions
descriptionPort
	<magritteDescription>
	
	^ MANumberDescription new 
		priority: 30;
		label: 'Port';
		accessor: #port;
		beRequired;
		yourself