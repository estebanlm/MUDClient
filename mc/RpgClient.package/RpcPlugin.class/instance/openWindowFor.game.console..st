private
openWindowFor: aPlugin game: aGame console: aConsole
	| window |
	window := self windowFor: aPlugin game: aGame.
	window open.
	aConsole addDependentWindow: window	