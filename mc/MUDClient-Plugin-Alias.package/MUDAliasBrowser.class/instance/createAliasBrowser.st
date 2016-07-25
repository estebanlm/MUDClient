building
createAliasBrowser
	| browser |
	
	browser := GLMTabulator new.
	browser
		column: #aliases;
		column: #alias span: 2.
		
	browser transmit 
		to: #aliases;
		andShow: [ :a | 
			a fastList
				title: 'Commands';
				in: [ :this | self addAliasMenuOn: this ];
				display: [ self aliases ];
				format: [ :alias | alias name ]].

	browser transmit 
		from: #aliases;
		to: #alias;
		andShow: [ :a | 
			a tkMagritte
				title: [ :alias | alias name ] ].
			
	^ browser