building
createVariablesBrowser
	| browser |
	
	browser := GLMTabulator new.
	browser
		column: #variables;
		column: #variable span: 2.
		
	browser transmit 
		to: #variables;
		andShow: [ :a | 
			a fastList
				title: 'Variables';
				in: [ :this | self addVariableMenuOn: this ];
				display: [ self variables ];
				format: [ :var | var name ]].

	browser transmit 
		from: #variables;
		to: #variable;
		andShow: [ :a | 
			a tkMagritte
				title: [ :var | var name ] ].
	^ browser