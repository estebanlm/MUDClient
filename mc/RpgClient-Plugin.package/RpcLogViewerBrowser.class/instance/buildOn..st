building
buildOn: browser 
	
	browser
		column: #logs;
		column: #log span: 3.
		
	browser transmit 
		to: #logs;
		andShow: [ :a | 
			a fastList
				title: 'Logs';
				display: [ self logs ];
				format: [ :log | self toLogName: log ] ].

	browser transmit 
		to: #log;
		from: #logs;
		andShow: [ :a | 
			a morph 
				title: [ :log | self toLogName: log ];
				morph: [ :presenter :log | self buildAreaMorphFor: log ] ]