accessing
removeFilter: aFilter 
	(MUDFilterBrowserSettings findByFilter: self) 
		ifNotNil: [ :setting | setting remove ].
	^ self filters remove: aFilter