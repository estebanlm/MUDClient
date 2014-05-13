building
buildGamesOn: a
	a list
		title: 'Games';
		act: [ :presenter | | newGame |
				newGame := self addGame. 
				presenter update.
				presenter selection: newGame ]
			icon: RpcIcons uniqueInstance newGameIcon
			entitled: 'New game';
		display: [ self games ];
		format: #name.
