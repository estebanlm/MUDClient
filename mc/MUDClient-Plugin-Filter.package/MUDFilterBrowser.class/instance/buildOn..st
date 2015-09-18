building
buildOn: browser 
	browser column: #filters.
	browser transmit 
		to: #filters;
		andShow: [ :a |
			self filters do: [ :each |
				a morph 
					title: [ self titleFor: each ];
					display: [ self areasAt: each ifAbsentPut: [ self buildAreaMorph ]];
					initialize: [ :presenter | self dirtiesAt: each put: false ]].
			a updateOn: MUDFilterUpdated from: self announcer.
			a announcer when: GLMPresentationActivated send: #presentationActivated: to: self ]