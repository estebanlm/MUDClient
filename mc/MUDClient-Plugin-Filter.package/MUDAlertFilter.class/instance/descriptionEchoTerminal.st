descriptions
descriptionEchoTerminal
	<magritteDescription>
	
	^ MABooleanDescription new 
		priority: 120;
		label: 'Echo Terminal';
		accessor: (MAPluggableAccessor 
			read: [ :filter | filter isEchoTerminal ]
			write: [ :filter :value | filter echoTerminal: value ]);
		yourself