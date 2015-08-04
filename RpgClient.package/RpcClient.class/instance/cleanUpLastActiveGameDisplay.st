accessing
cleanUpLastActiveGameDisplay
	self lastActiveGame ifNil: [ ^ self ].
	(self gameDisplayConfigurationAt: self lastActiveGame) cleanUpDisplay.