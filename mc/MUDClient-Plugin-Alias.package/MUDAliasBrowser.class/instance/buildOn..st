building
buildOn: browser

	browser
		column: #aliases;
		column: #alias span: 2.
		
	browser transmit 
		to: #aliases;
		andShow: [ :a | 
			a fastList
				title: 'Alias';
				in: [ :this | self addAliasMenuOn: this ];
				display: [ self aliases ];
				format: [ :alias | alias name ]].

	browser transmit 
		from: #aliases;
		to: #alias;
		andShow: [ :a | 
			a magritte
				title: [ :alias | alias name ] ]