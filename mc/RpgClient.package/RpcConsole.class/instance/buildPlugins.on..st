building
buildPlugins: aPosition on: browser
	self hasGame ifFalse: [ ^ self ].
	(self game plugins 
		select: [ :each | each definition position = aPosition ])
		withIndexDo: [ :each :index | | port |
			port := ('plugin-', aPosition kind, '-', index asString) asSymbol.
			browser row: port.
			browser transmit 
				to: port; 
				andShow: [ :a | 
					a custom: (each browserClass game: self game plugin: each )]]