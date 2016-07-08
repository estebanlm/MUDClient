private
clearArea
	| inset |
	inset := (#(topRight bottomRight) includes: self notifyPosition) 
		ifTrue: [ 5@ -8 ]
		ifFalse: [ 5@5 ].
	^ self owner bounds insetBy: inset