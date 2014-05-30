generation
generate 
	| browser |

	value := nil.
	browser := self buildBrowser.
	browser startOn: #().
	window := GLMMorphicRenderer new renderWindow: browser.
	window openModalCentered.
	
	^ self value
		ifNotNil: [ self createObject ]