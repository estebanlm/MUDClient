private
openWindowFor: aPlugin game: aGame terminal: aTerminal
	| window |
	window := self windowFor: aPlugin game: aGame.
	window owner: aTerminal.
	aTerminal addDependentWindow: window.
	window open.
	