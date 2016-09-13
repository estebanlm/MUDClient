updating
updateGamePanelWith: aGame
	| widget |
	gamePanel removeAll.
	aGame ifNil: [ ^ self ].
	widget := aGame asPresenter 
		addButtons: {
			MarsButtonPresenter label: 'Accept' icon: #accept asMUDIcon action: [ :this | this save ]. 
			MarsButtonPresenter label: 'Cancel' icon: #cancel asMUDIcon action: [ :this | this cancel ].
		};
		onAnswer: [ :v | v ifNotNil: [ self updateListBox ] ];
		widget.
	(gamePanel packStart: widget) showAll.