private
filterVariables: aString
	| activeVariables |
	
	(aString includes: $$) ifFalse: [ ^ aString ]. 
	(activeVariables := self activeVariables) ifEmpty: [ ^ aString ].
	^ activeVariables
		detect: [ :each | each matches: aString ] 
		ifFound: [ :each | aString copyReplaceAll: each name with: each value ]
		ifNone: [ aString ]