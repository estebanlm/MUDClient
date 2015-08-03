private
windowClosed: ann
	self hasActiveGame ifFalse: [ ^ self ].
	self activeDisplayConfiguration unregisterWindow: ann window