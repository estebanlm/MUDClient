descriptions
descriptionEchoDesktop
	<magritteDescription>
	
	^ MABooleanDescription new 
		priority: 120;
		label: 'Echo Desktop';
		accessor: (MAPluggableAccessor 
			read: [ :filter | filter isEchoDesktop ]
			write: [ :filter :value | filter echoDesktop: value ]);
		yourself