private
titleFor: aFilter
	^ (self dirtyAt: aFilter)
		ifTrue: [ '*', aFilter name ]
		ifFalse: [ aFilter name ]