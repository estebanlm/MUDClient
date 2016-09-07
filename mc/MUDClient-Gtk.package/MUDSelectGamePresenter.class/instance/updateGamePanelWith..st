actions
updateGamePanelWith: aGame
	| contentWidget |
	gamePanel removeAll.
	aGame ifNil: [ ^ self ].
	contentWidget := aGame asPresenter widget.
	gamePanel packStart: contentWidget.
	contentWidget showAll.