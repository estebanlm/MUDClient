as yet unclassified
act: aBlock icon: anIcon entitled: aString
	^ self new 
		action: aBlock;
		icon: anIcon;
		title: aString;
		yourself
