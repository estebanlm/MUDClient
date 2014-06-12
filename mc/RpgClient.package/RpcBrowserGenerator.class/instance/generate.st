generation
generate 
	| browser |

	value := nil.
	browser := self buildBrowser.
	browser startOn: #().
	window := GLMRenderer renderer renderWindow: browser.
	window openModalCentered.
	
	^ self value
		ifNotNil: [ self createObject ]