building
buildOn: browser 
	
	browser
		column: #notes;
		column: #note span: 3.
		
	browser transmit 
		to: #notes;
		andShow: [ :a | 
			a tree
				title: 'Notes';
				in: [ :presenter |  self addNotesMenuOn: presenter ];
				display: [ self roots ];
				format: #title;
				children: [ :node |
					node isGroup 
						ifTrue: [ self childrenOf: node ]
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
		andShow: [ :a | a 
			morph morph: [ :presenter :note | 
				self buildAreaMorphFor: note ] ]