descriptions
descriptionName
	<magritteDescription>
	
	^ MAStringDescription new 
		priority: 10;
		label: 'Name';
		accessor: (MAPluggableAccessor 	
			read: [ :this | this name ifNotNil: [ :v | v allButFirst ] ]
			write: [ :this :aValue | this name: '$', aValue ]);
		beRequired;
		yourself