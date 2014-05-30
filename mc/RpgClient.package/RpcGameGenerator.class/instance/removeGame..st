actions
removeGame: aGame 
	(self confirm: ('Are you sure you want to remove "{1}"?' format: { aGame name }))
		ifFalse: [ ^ false ].
	aGame remove	.
	^ true