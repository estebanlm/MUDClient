descriptions
descriptionName
	<magritteDescription>
	<presenters: #(inspect view)>
	
	^ MAStringDescription new 
		priority: 10;
		label: 'Name';
		accessor: #cleanName;
		beReadonly;
		yourself
