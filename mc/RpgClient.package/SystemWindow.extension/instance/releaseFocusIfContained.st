*RpgClient
releaseFocusIfContained
	"Release the focus if active morph is contained in window"
	| ownerMorphs activeMorph |
	
	activeMorph := self activeHand keyboardFocus. 
	ownerMorphs := OrderedCollection with: activeMorph.
	[ activeMorph owner isNil ] whileFalse: [ 
		activeMorph := activeMorph owner.
		ownerMorphs add: activeMorph ].
	(ownerMorphs includes: self) 
		ifTrue: [ self activeHand newKeyboardFocus: nil ]	