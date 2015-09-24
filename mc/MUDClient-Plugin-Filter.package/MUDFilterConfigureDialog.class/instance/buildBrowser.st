building
buildBrowser
	| browser |
	
	browser := GLMTabulator new 
		title: self class title;
		initialExtent: self class preferredExtent;
		column: #objects;
		column: #currentObject span: 2;
		yourself.
		
	browser transmit 
		to: #objects;
		andShow: [ :a | self buildObjectsOn: a ].
		
	browser transmit
		from: #objects;
		to: #currentObject;
		andShow: [ :a | self buildCurrentObjectOn: a ].
		
	^ browser