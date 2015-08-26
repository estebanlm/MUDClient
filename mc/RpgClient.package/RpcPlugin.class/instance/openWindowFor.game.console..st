private
openWindowFor: aPlugin game: aGame console: aConsole
	| window |
	window := self windowFor: aPlugin game: aGame.
	window owner: aConsole.
	aConsole addDependentWindow: window.
	window open.
	