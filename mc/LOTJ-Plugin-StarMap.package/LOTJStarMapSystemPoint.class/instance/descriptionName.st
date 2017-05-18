descriptions
descriptionName
	<magritteDescription>
	
	^ MAStringDescription new 
		priority: 110;
		label: 'Name';
		accessor: #name;
		beReadonly;
		yourself
