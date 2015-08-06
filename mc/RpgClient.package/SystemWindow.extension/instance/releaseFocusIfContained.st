*RpgClient
releaseFocusIfContained
	"Release the focus if active morph is contained in window"
	| ownerMorphs activeMorph |
	
	activeMorph := self activeHand keyboardFocus. 
	ownerMorphs := OrderedCollection new.
	[ activeMorph isNil ] whileFalse: [ 
		ownerMorphs add: activeMorph.
		activeMorph := activeMorph owner ].
	(ownerMorphs includes: self) 
		ifTrue: [ self activeHand newKeyboardFocus: nil ]	