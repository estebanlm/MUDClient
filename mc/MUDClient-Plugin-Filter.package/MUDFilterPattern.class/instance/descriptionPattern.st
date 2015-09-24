descriptions
descriptionPattern 
	<magritteDescription>

	^ MAStringDescription new 
		priority: 10;
		label: 'Match';
		accessor: #pattern;
		beRequired;
		yourself	