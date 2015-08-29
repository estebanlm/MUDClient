descriptions
descriptionHost
	<magritteDescription>
	
	^ MAStringDescription new 
		priority: 20;
		label: 'Host';
		accessor: #host;
		beRequired;
		yourself