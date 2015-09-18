private
titleFor: aFilter
	^ (self dirtiesAt: aFilter)
		ifTrue: [ '*', aFilter name ]
		ifFalse: [ aFilter name ]