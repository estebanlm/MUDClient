descriptions
descriptionEcho
	<magritteDescription>
	
	^ MABooleanDescription new 
		priority: 100;
		label: 'Echo';
		accessor: (MAPluggableAccessor 
			read: [ :filter | filter isEcho ]
			write: [ :filter :value | filter echo: value ]);
		yourself