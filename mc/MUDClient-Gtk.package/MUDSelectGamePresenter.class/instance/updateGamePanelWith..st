actions
updateGamePanelWith: aGame
	gamePanel removeAll.
	aGame ifNil: [ ^ self ].
	gamePanel packStart: aGame asPresenter widget