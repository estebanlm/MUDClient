descriptions
descriptionPatterns
	<magritteDescription>
	
	^ MAToManyRelationDescription new
		priority: 40;
		label: 'Patterns';
		classes: { MUDFilterPattern };
		accessor: #patterns;
		display: [ :v | v pattern truncateWithElipsisTo: 28 ];
		default: (OrderedCollection new);
		yourself