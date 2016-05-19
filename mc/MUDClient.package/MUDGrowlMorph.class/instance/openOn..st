showing
openOn: aMorph
	self privateOwner: aMorph.
	self position: self unoccupiedPosition.
	aMorph addMorph: self.
	World startSteppingSubmorphsOf: self.