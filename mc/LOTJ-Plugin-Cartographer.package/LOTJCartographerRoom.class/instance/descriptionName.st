descriptions
descriptionName
	<magritteDescription>
	<view>
	
	^ MAStringDescription new 
		priority: 10;
		label: 'Name';
		accessor: #cleanName;
		beReadonly;
		yourself
