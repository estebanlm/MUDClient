private
withNext: aCollection excluding: excludeCollection levelConnectionsDo: aBlock
	| next |
	
	aCollection ifEmpty: [ ^ self ].
	next := OrderedCollection new.
	aCollection do: [ :eachRoom | 
		eachRoom withLevelConnectionsDo: [ :eachConnection |
			(excludeCollection includes: eachConnection room) ifFalse: [ 
				aBlock value: eachConnection.
				next add: eachConnection room ] ] ].
	self 
		withNext: next 
		excluding: (excludeCollection, next) 
		levelConnectionsDo: aBlock