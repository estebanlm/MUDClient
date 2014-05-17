accessing
root 
	| root |
	
	root := self.
	[ root parent isNil ]
	whileFalse: [ root := root parent ].
	
	^ root