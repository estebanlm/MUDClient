*RpgClient
silentlyDelete
	"Same as #delete, but does not informs its deletion"
	| animateClose |
	self mustNotClose ifTrue: [^ self].
	(self owner notNil and: [self owner isWorldMorph])
		ifTrue: [self activate].
	model ifNotNil: [ model okToChange ifFalse: [ ^ self ] ].
	animateClose := (self visible and: [self world notNil and: [
		self theme settings animationSettings useAnimation and: [
		self theme settings animationSettings animateClosing]]]).
	self removePaneSplitters. "in case we add some panes and reopen!"
	
	self isFlexed
		ifTrue: [owner delete]
		ifFalse: [super delete].
	model ifNotNil: [ 
		model 
			windowIsClosing; 
			release ].
	model := nil.
	animateClose ifTrue: [self animateClose]