descriptions
descriptionPattern 
	<magritteDescription>

	^ MAStringDescription new 
		priority: 20;
		label: 'Match';
		accessor: #pattern;
		beRequired;
		yourself	