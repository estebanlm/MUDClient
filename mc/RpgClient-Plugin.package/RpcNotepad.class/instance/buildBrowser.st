building
buildBrowser 
	| browser |
	
	browser := GLMTabulator new 
		title: self class title;
		column: #notes;
		column: #note span: 3;
		yourself.
		
	browser transmit 
		to: #notes;
		andShow: [ :a | 
			a tree
				in: [ :presenter |  self addNotesMenuOn: presenter ];
				format: #title;
				children: [ :node |
					node isGroup 
						ifTrue: [ node children ]
						ifFalse: [ #() ] ] ].

	browser transmit 
		to: #note;
		from: #notes;
		when: [ :node | node notNil and: [ node isGroup ] ];
		andShow: [ :a | 
			a list
				display: [ :node | node children ];
				format: #title ].

	browser transmit 
		to: #note;
		from: #notes;
		when: [ :node | node notNil and: [ node isGroup not ] ];
		andShow: [ :a | a morph morph: [ :note | self buildAreaMorphFor: note ] ].
	
	^ browser