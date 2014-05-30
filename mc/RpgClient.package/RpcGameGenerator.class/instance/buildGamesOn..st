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
		selectionAct: [ :presenter | 
				(self removeGame: presenter selection)
					ifTrue: [ presenter update ] ]
			entitled: 'Remove';
		display: [ self games ];
		format: #name.
