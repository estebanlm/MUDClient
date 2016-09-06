actions
updateGamePanelWith: aGame
	| w |
	gamePanel removeAll.
	aGame ifNil: [ ^ self ].
	w := aGame asPresenter widget.
	gamePanel packStart: w.
	w showAll.