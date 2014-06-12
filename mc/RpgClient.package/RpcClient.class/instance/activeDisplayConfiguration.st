accessing
activeDisplayConfiguration
	self hasActiveGame ifFalse: [ self error: 'No active game.' ].
	^ self gameDisplayConfigurationAt: self activeGame