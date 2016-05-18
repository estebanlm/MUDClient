actions
launch: aFilter
	launchAction ifNil: [ ^ self ].
	aFilter activate.
	launchAction value: aFilter