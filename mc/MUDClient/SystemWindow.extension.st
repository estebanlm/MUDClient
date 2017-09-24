Extension { #name : #SystemWindow }

{ #category : #'*MUDClient' }
SystemWindow >> openModalCentered [
	self 
		fullBounds;
		openInWorld;
		position: Display extent - self extent // 2.	
	Smalltalk ui theme runModal: self.
]

{ #category : #'*MUDClient' }
SystemWindow >> silentlyDelete [
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
]

{ #category : #'*MUDClient' }
SystemWindow >> withAllSubmorphsDo: aBlock [
	self withAllSubmorphsOf: self do: aBlock
]

{ #category : #'*MUDClient' }
SystemWindow >> withAllSubmorphsOf: aMorph do: aBlock [
	aMorph submorphs do: [ :each |
		aBlock value: each.
		self withAllSubmorphsOf: each do: aBlock ]
]
